public class ContactHandler2 {
public static void handleContacts(Map<Id, Contact> newContactMap) {
     Map<Id, Contact> PrimaryContactMap = new Map<Id, Contact>();
     List<Contact> contacts = new List<Contact>();
        List<Account> accounts= new List<Account>();
        for (Contact newContact : newContactMap.values()) {
            if (newContact.Is_Primary__c==True) {                
                PrimaryContactMap.put(newContact.AccountId, newContact);
                contacts.addAll([SELECT Id, Is_Primary__c FROM Contact WHERE AccountId = :newContact.AccountId AND Id != :newContact.Id]);
            }
        }

    for (Contact contactToUpdate : contacts) {
            contactToUpdate.Is_Primary__c = false;
            
        }
        update contacts ;
    for (Id accountId : PrimaryContactMap.keySet()) {
            Account acc = new Account(Id = accountId, Primary_Contact__c = PrimaryContactMap.get(accountId).Id);
            accounts.add(acc);
        }

        update accounts;
    }  
    public static void handleDelete(Map<Id, Contact> oldContactMap){
        Map<Id, Contact> PrimaryContactMap = new Map<Id, Contact>();
        for(Contact oldContact: oldContactMap.Values()){
            if(oldContact.Is_Primary__c){
               PrimaryContactMap.put(oldContact.AccountId, null); 
            }
            
        }
    }
}