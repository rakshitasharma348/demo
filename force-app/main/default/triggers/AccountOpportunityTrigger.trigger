trigger AccountOpportunityTrigger on Account (after insert, before update) {
    AccountOpportunityTriggerHandler.handleUpdate(Trigger.new,Trigger.oldMap);
}