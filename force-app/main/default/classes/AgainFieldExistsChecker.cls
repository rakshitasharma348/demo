public class AgainFieldExistsChecker {
    @AuraEnabled(cacheable=true)
    public static Object getFieldDetailss(String objectApiName, String fieldName) {
        try {
            // Get the describe information for the object
            Schema.DescribeSObjectResult objectDescribe = Schema.getGlobalDescribe().get(objectApiName).getDescribe();
            
            // Get the map of fields for the object
            Map<String, Schema.SObjectField> fieldMap = objectDescribe.fields.getMap();
            System.debug(fieldMap);
            
            // Check if the field exists
            if (fieldMap.containsKey(fieldName)) {
                Schema.DescribeFieldResult fieldDescribe = fieldMap.get(fieldName).getDescribe();
                
                // If the field is a reference (lookup), fetch the related object name
                if (fieldDescribe.getType() == Schema.DisplayType.REFERENCE) {
                    // Return the related object name
                    System.debug( fieldDescribe.getReferenceTo()[0].getDescribe().getName());
                } else {
                    // Return the field describe information
                    System.debug( fieldDescribe);
                }
            }
        } catch(Exception e) {
            // Handle any exceptions, such as if the object or field does not exist
            System.debug('An error occurred: ' + e.getMessage());
        }
        
        return null;
    }
}

       /*
List<String> result=new   List<String>();
Map <String,Schema.SObjectType> gd = Schema.getGlobalDescribe();
Schema.SObjectType sobjType = gd.get(objectApiname);
Schema.DescribeSObjectResult r = sobjType.getDescribe();
Map<String, Schema.SObjectField> MapofField = r.fields.getMap();
for(String fieldName : MapofField.keySet()) 
{
Schema.SObjectField field = MapofField.get(fieldName);
Schema.DescribeFieldResult F = field.getDescribe();
System.debug('Field Name: '+F.getName());
System.debug(F);
result.add(F.getName());
/* if(F.getName()==realtionFieldName){
System.debug('field exist');
exist=true;
break;

}

return result;

}*/