trigger OpportunityTrigger on Opportunity (after Update) {
    if(Trigger.isAfter && Trigger.isUpdate){
        OpportunityTriggerHandler.handleActivities(Trigger.new);
    }

}