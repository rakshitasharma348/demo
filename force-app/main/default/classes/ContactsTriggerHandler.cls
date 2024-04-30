public class ContactsTriggerHandler {
    public static void handle( List<Contact> newContacts){
        List<Account> updateAccounts=new List<Account>();
        List<Id> accountIds= new List<Id>();
        Map<Id,Id> accountToContact= new Map<Id,Id>();
        
        for(Contact con: newContacts){
            accountToContact.put(con.AccountId, con.Id);
            accountIds.add(con.AccountId);   
        }
   List<Account> accountsToUpdate =[SELECT Id,Contacts__c FROM  Account WHERE Id IN: accountIds];   
        for(Account acc:accountsToUpdate){
          String existingContacts= acc.Contacts__c;
            System.debug(existingContacts);
            String newConId= accountToContact.get(acc.Id);
            System.debug(newConId);
            acc.Contacts__c =existingContacts+','+newConId;                             
            updateAccounts.add(acc);
            
        }
        update updateAccounts;
    }

}