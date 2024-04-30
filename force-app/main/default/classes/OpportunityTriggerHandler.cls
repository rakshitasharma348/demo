public class OpportunityTriggerHandler {
    public static void  handleActivities( List<Opportunity> newRecords){
        List<Task> taskListtoInsert = new List<Task>();
        for(Opportunity opp: newRecords){
            if(opp.StageName=='Closed Won'){
                Task taskRecord= new Task();
                taskRecord.Priority='High';
                taskRecord.OwnerId = opp.OwnerId;
                taskRecord.Description = 'please split  the revenue among  the team members';
                taskRecord.Status ='Not Started';
                taskRecord.Subject = 'Split Revenue';
                taskRecord.WhatId=opp.Id;
                taskListtoInsert.add(taskRecord); 
            }
        }
        if(!taskListtoInsert.isEmpty())
            insert taskListtoInsert;
        
        
    }

}