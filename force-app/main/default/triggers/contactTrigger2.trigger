trigger contactTrigger2 on Contact (after insert, after update, after delete) {
    
    if (Trigger.isAfter) {
        if (Trigger.isInsert || Trigger.isUpdate) {
            ContactHandler2.handleContacts(Trigger.newMap);
        }
        else if(Trigger.isDelete){
            ContactHandler2.handleDelete(Trigger.oldMap);
        }
    }
}