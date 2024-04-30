public class MetaDataServiceHandler {
    @auraEnabled
    public static void createObject(String   objectName, String objectAPI, String   objectPlural) {
        MetadataService.MetadataPort   metadataservice = new MetadataService.MetadataPort();
        metadataservice.SessionHeader =   new MetadataService.SessionHeader_element();
        
metadataservice.SessionHeader.sessionId = session.getSessionIdFromVFPage(Page.SessionId);
       //  metadataservice.SessionHeader.sessionId =UserInfo.getSessionId();
         List<MetadataService.CustomObject> objectList = new List<MetadataService.CustomObject>();
        MetadataService.CustomObject   customobject = new MetadataService.CustomObject();
        customobject.fullName =   objectAPI;
        customobject.label =   objectName;
        customobject.pluralLabel =   objectPlural;
        customObject.nameField = new MetadataService.CustomField();
        customobject.nameField.type_x =   'Text';
        customobject.nameField.label = 'Name';
        customobject.deploymentStatus =   'Deployed';
        customObject.sharingModel = 'ReadWrite';
        objectList.add(customobject);
         metadataservice.createMetadata(objectList);
    }

}