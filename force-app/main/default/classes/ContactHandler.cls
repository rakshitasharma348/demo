public class ContactHandler {
    
    public static void handleContactUniqueness(List<Contact> newContacts) {
        Set<String> contactKeySet = new Set<String>();
            for (Contact existingContact : [SELECT FirstName, LastName, Email FROM Contact]) {
         String Existing = existingContact.FirstName + existingContact.LastName + existingContact.Email;
                contactKeySet.add(Existing);
                
            }

        for (Contact contact : newContacts) {
            String contactKey = contact.FirstName + contact.LastName + contact.Email;
            
            if (contactKeySet.contains(contactKey)) {
                contact.addError('A contact with the same FirstName, LastName, and Email already exists.');
            } else {
                contactKeySet.add(contactKey);
            }
        
    }
}


}