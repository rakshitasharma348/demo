public class UpdateAllOpportunitiesHandler {
    public static void handleUpdate(List<Account> acclist){
        Set<Id>  accIds = new Set<Id>();
        for(Account acc:acclist){
            accIds.add(acc.Id);
        }
        DateTime day30 = System.now()-30;
        List<Opportunity> oppListToUpdate = new List<Opportunity>();
        List<Opportunity> oppList = [SELECT Id, AccountId, StageName,CloseDate,CreatedDate FROM Opportunity Where AccountId IN :accIds];
        if(oppList.size()>0){
            for(Opportunity opp:oppList){
                if(opp.CreatedDate<day30 && opp.StageName!='Closed Won'){
                    opp.StageName='Closed Lost';
                    opp.CloseDate=system.today();
                    oppListToUpdate.add(opp);
                }
            }            
        }
        if(oppListToUpdate.size()>0){
            update oppListToUpdate;
        }
    }

}