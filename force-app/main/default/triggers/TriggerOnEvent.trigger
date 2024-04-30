trigger TriggerOnEvent on Event__c (after insert) {
    if(trigger.isafter && trigger.isinsert){
    EventHandler.handleEvent(trigger.new);
}
}