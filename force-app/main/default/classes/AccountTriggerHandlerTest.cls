@isTest
public class AccountTriggerHandlerTest {
@isTest
    static void testHealthWelfareAccountCreation() {
        Account testAccount = new Account(
            Name = 'Test Account',
            Account_Type__c = 'Health Welfare Fund'
        );
        insert testAccount;
        List<Opportunity> opportunities = [SELECT Id,Name FROM Opportunity WHERE AccountId = :testAccount.Id];


        System.assertEquals(1, opportunities.size());
        System.assertEquals('Health Welfare Fund', opportunities[0].Name);

    }
}