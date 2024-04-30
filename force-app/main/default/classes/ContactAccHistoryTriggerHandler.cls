public class ContactAccHistoryTriggerHandler {
    public static void handleInsert(List<Contact> newRecords){
        List<ContactAccountHistory__c> listToUpdate= new List<ContactAccountHistory__c>();
        for(Contact con:newRecords ){
            if(con.AccountId != null){
                ContactAccountHistory__c	 newCAH= new  ContactAccountHistory__c(
                    Account__c=con.AccountId,
                    Contact__c =con.Id,
                    Designation__c=con.Designation__c
                );
                listToUpdate.add(newCAH);               
            }
        }
        if(!listToUpdate.isEmpty()){
            insert listToUpdate;
        }
    }
    public static void   handleUpdate(List<Contact> newRecords, Map<Id,Contact> conOldMap){
        List<ContactAccountHistory__c> listToUpdate= new List<ContactAccountHistory__c>();
        
        for(Contact con:newRecords ){
            if(conOldMap!=null &&(con.AccountId != conOldMap.get(con.Id).AccountId && con.AccountId != null)||con.Designation__c!=conOldMap.get(con.Id).Designation__c){
                ContactAccountHistory__c	 newCAH= new  ContactAccountHistory__c(
                    Contact__c =con.Id,
                    Account__c=con.AccountId,
                    Designation__c=con.Designation__c );
                listToUpdate.add(newCAH);
                
            }
            
            }
        if(!listToUpdate.isEmpty()){
                insert listToUpdate;
        }
        
    }
}