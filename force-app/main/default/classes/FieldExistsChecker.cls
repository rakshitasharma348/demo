public class FieldExistsChecker {
    @AuraEnabled(cacheable=true)
    public static Boolean checkFieldExists(String objectApiName, String fieldName) {
        try {
            // Get the describe information for the object
            Schema.DescribeSObjectResult objectDescribe = Schema.getGlobalDescribe().get(objectApiName).getDescribe();
            System.debug(objectDescribe);
            
            // Get the map of fields for the object
            Map<String, Schema.SObjectField> fieldMap = objectDescribe.fields.getMap();
            System.debug(fieldMap);
            
            // Check if the field exists
            if (fieldMap.containsKey(fieldName)) {
               
                System.debug('true');
            }
            else{
                System.debug('false');
            }
        } catch(Exception e) {
            // Handle any exceptions, such as if the object or field does not exist
            System.debug('An error occurred: ' + e.getMessage());
        }
        
        return false;
    }
    

}