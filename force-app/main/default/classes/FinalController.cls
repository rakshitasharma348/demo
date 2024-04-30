public class FinalController {
    @AuraEnabled
    public static List<SObject> getData(String queryString, String objectApiName, String accId, String relationshipfield, String Condition) {
           accId = '\''+ accId + '\'';
         
        String finalQuerystring = 'SELECT ' + queryString +' FROM ' + objectApiName  + '  WHERE '+ relationshipfield +' = ' +accId +' AND '+Condition;
        List<SObject> objects = Database.query(finalQuerystring);
        
        System.debug('Final Query: ' + finalQuerystring);
        System.debug('Query Result: ' + objects);
        
        return objects;
    }
}