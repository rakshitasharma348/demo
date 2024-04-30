@isTest
public class ContactAccHistoryTest {   
    @isTest
    static void testContactTrigger() {
       
        Account testAccount = new Account(Name ='hhhhh');
        insert testAccount;

        
        Contact testContactWithAccount = new Contact(
            FirstName = 'hhhh',
            LastName = 'Contact',
            AccountId = testAccount.Id,
            Designation__c = 'Developer'
        );
        insert testContactWithAccount;
        
        Contact testUpdate = new Contact(
            
            Id=testContactWithAccount.Id,
            
            Designation__c = 'QA'
        );
        
          UPDATE testUpdate;
        
        List<ContactAccountHistory__c> historyRecords = [SELECT Id FROM ContactAccountHistory__c WHERE Contact__c = :testContactWithAccount.Id];

        
        System.assertEquals(1, historyRecords.size(), 'Contact Account History record not created');
    }
   // static void testContactTrigger() {
      //  Contact con= new Conta
    
}