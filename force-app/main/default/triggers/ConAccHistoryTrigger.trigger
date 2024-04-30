trigger ConAccHistoryTrigger on Contact (after  insert, after update) {
    if(Trigger.isAfter && Trigger.isInsert){
        ContactAccHistoryTriggerHandler.handleInsert(Trigger.new);
    }
    if(Trigger.isAfter && Trigger.isUpdate){
        ContactAccHistoryTriggerHandler.handleUpdate(Trigger.new, Trigger.oldMap);
    }

}