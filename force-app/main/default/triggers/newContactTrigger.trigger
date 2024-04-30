trigger newContactTrigger on Contact (after  insert, after update) {
    if(Trigger.isAfter){
        if(Trigger.isInsert || Trigger.isUpdate){
        PrimaryContactHandler.handlePrimaryContact(Trigger.new);
    }   
    
    }
}