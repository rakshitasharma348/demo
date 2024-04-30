trigger PaymentTrigger on Payment__c (after insert) {
    List<Id> pids= new List<Id>();
    pids.addAll(Trigger.newMap.keySet());
    PaymentTriggerHandler.handle(pids);

}