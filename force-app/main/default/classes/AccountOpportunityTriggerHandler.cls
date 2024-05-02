public class AccountOpportunityTriggerHandler {
    public static void handleUpdate(List<Account> newAccounts, Map<Id, Account> oldMap) {
        List<Opportunity> newOpportunities = new List<Opportunity>();
         Set<Id> Ids = new Set<Id>();
        for (Account acc : newAccounts) {
            if ((Trigger.isInsert && acc.Account_Type__c == 'Health Welfare Fund') ||
                (Trigger.isUpdate && oldMap.get(acc.Id).Account_Type__c != acc.Account_Type__c && acc.Account_Type__c == 'Health Welfare Fund')) {
                Ids.add(acc.Id);
            }
        }

        if (!Ids.isEmpty()) {
            
            Map<Id, Opportunity> existingOpportunitiesMap = new Map<Id, Opportunity>();
		for(Opportunity opp: [SELECT Id, AccountId FROM OPPORTUNITY WHERE AccountId IN : Ids ]){
                 existingOpportunitiesMap.put(opp.AccountId,opp);
          } 

            for (Account acc : newAccounts) {
                if (Ids.contains(acc.Id) && !existingOpportunitiesMap.containsKey(acc.Id)) {
                    Opportunity newOpportunity = new Opportunity();
                    newOpportunity.AccountId = acc.Id;
                    newOpportunity.Name = 'Health Welfare Fund';
                    newOpportunity.StageName = 'Prospecting';
                    newOpportunity.CloseDate = Date.newInstance(2024,1,2);
                    
                    newOpportunities.add(newOpportunity);
                }
            }
        }

        if (!newOpportunities.isEmpty()) {
            insert newOpportunities;
            //rakshitaSharma
            //chhavi
        }
    }
}