public class findRelationship {
   
    static  List<String> result=new   List<String>();
    @AuraEnabled
    
    public static List<String> findrelation(String objectApiName ,String realtionShipField){
 	//List<wrapper> wrList=new List<wrapper>();
        
       //wrapper
        try {
            // Get the describe information for the object
            Schema.DescribeSObjectResult objectDescribe = Schema.getGlobalDescribe().get(objectApiName).getDescribe();
            
            // Get the map of fields for the object
            Map<String, Schema.SObjectField> fieldMap = objectDescribe.fields.getMap();
            System.debug(fieldMap);
            if (fieldMap.containsKey('Account')){
                System.debug('Account Exists');
            }
             
            // Check if the field exists
            if (fieldMap.containsKey(realtionShipField)) {
                Schema.DescribeFieldResult fieldDescribe = fieldMap.get(realtionShipField).getDescribe();
                
                // If the field is a reference (lookup), fetch the related object name
                if (fieldDescribe.getType() == Schema.DisplayType.REFERENCE) {
                    // Return the related object name
                    System.debug( fieldDescribe.getReferenceTo()[0].getDescribe().getName());
                   result.add( fieldDescribe.getReferenceTo()[0].getDescribe().getName());
                   // ParentName=fieldDescribe.getReferenceTo()[0].getDescribe().getName();
                } else {
                    // Return the field describe information
                    System.debug('fieldDescribe ---------'+  fieldDescribe);
                }
                 if (fieldMap.containsKey('Account')) {
            // Get the describe information for the 'Account' object
            Schema.DescribeFieldResult accountFieldDescribe = fieldMap.get('Account').getDescribe();
                     System.debug(accountFieldDescribe);
            

            }
            for(String fieldName : fieldMap.keySet()) 
            {
                Schema.SObjectField field = fieldMap.get(fieldName);
                Schema.DescribeFieldResult F = field.getDescribe();
                System.debug('Field Name: '+F.getName());
                System.debug(F);
                result.add(F.getName());
            }
            result.add('Name');
            }} catch(Exception e) {
            // Handle any exceptions, such as if the object or field does not exist
            System.debug('An error occurred: ' + e.getMessage());
        }
        
        return result;
    }
    
     @AuraEnabled
    public static List<Sobject> getData(string queryString ,String objectApiName ,String parentName){
        List<String> data=new   List<String>();
        String finalQuerystring= 'Select '+queryString+',Account.Name from '+objectApiName;
        System.debug( 'final QUery'+finalQuerystring);
        return Database.query(finalQuerystring);
    }
  }