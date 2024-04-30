public class FieldController {
    @AuraEnabled
    public static void generateTextField(String objectAPIName, String fieldAPIName, String fieldDescription, String fieldLabel){
        system.debug('fieldAPIName'+fieldAPIName);
        MetadataService.MetadataPort metadataservice = new MetadataService.MetadataPort();
        metadataservice.SessionHeader =   new MetadataService.SessionHeader_element();
        metadataservice.SessionHeader.sessionId = session.getSessionIdFromVFPage(Page.SessionId);
        //metadataservice.SessionHeader.sessionId =UserInfo.getSessionId();
        List<MetadataService.CustomField > fieldList = new List<MetadataService.CustomField >();
        MetadataService.CustomField    customfield = new MetadataService.CustomField();
        String fullNaming =objectAPIName;
        fullNaming += '.'+fieldAPIName+'__c';
        system.debug('fullNaming'+fullNaming);
        customField.fullName =   fullNaming;
        customField.label =   fieldLabel;
        customField.type_x = 'Text';
        customField.length = 52;
        system.debug('custom'+customField);
        fieldList.add(customField);
        metadataservice.createMetadata(fieldList);
    }

}