trigger TriggerBookOrder on Book_Order__c (after update) {
    if(Trigger.isAfter && Trigger.isUpdate){
        BookOrderHandler.handleOrder(Trigger.new, Trigger.oldMap);
    }

}