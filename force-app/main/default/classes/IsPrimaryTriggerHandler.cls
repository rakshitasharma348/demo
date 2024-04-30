public class IsPrimaryTriggerHandler {
    public void handlePrimaryContact(List<Contact> newContacts){
        Set<Id> accountIds = new Set<Id>();
        Map<Id,Id> aToCMap = new Map<Id,Id>();
        for(Contact con: newContacts){
            if(con.Is_Primary__c==True){
                accountIds.add(con.AccountId); 
                aToCMap.put(con.AccountId, con.Id); 
            }
        }
        List<Account> accountToUpdate= new List<Account>();
        for(Id accId:accountIds ){
            Account a= new Account(Id=accId, Primary_Contact__c = aToCMap.get(accId));
            accountToUpdate.add(a);
        }
        if(!accountToUpdate.isEmpty()){
            update accountToUpdate;
        }
    }
    
    public static void updateDelete(List<Contact> deletedContacts){
        Set<Id> accountIds = new Set<Id>();
        
        
        for (Contact contact : deletedContacts) {
            accountIds.add(contact.AccountId);
        }
        
        
        List<Account> accountsToUpdate = new List<Account>();
        for (Id accountId : accountIds) {
            Account acc = new Account(Id = accountId, Primary_Contact__c = null);
            accountsToUpdate.add(acc);
        }
        
        if (!accountsToUpdate.isEmpty()) {
            update accountsToUpdate;
        }
        
    }
}