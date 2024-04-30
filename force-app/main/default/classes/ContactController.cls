public class ContactController {
    @AuraEnabled
    public static void createContact(Id accountId, String firstName, String lastName, Boolean isPrimary) {
        if (isPrimary) {           
            List<Contact> existingPrimaryContacts = [SELECT Id FROM Contact WHERE AccountId = :accountId AND Is_Primary__c = true];
            for (Contact contactToUpdate : existingPrimaryContacts) {
                contactToUpdate.Is_Primary__c = false;
            }
            update existingPrimaryContacts;
        }
        Contact newContact = new Contact(
            AccountId = accountId,
            FirstName = firstName,
            LastName = lastName,
            Is_Primary__c = isPrimary
        );
        insert newContact;
        
        
    }
}