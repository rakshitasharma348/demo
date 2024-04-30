trigger TriggerOnSession on Session__c (after insert,after update ,after delete) {
    if(Trigger.isAfter && (Trigger.isUpdate || Trigger.isInsert)){
        SessionHandler.handleUpdates(Trigger.new,Trigger.oldMap);
    }
    if(Trigger.isafter && Trigger.isDelete){
        SessionHandler.handleDeletes(Trigger.old);
    }

}