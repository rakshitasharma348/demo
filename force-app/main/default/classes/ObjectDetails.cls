public class ObjectDetails {
   @auraEnabled(cacheable=true)
    public static List<Account> showListOfAccounts(){
        return[Select Id,Name,Site,Phone,Email__c from Account LIMIT 10];
    }
}