trigger TriggerOnTransaction on Transaction__c (before insert) {
    
        TransactionTrigger.handleInsert(Trigger.new);
    
}