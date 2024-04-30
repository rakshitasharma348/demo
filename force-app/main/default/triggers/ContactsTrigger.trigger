trigger ContactsTrigger on Contact (after insert,after update, before delete ) {
    if(Trigger.isInsert && Trigger.isAfter){
    ContactsTriggerHandler.handle(Trigger.new);
    }
    if(Trigger.isAfter && Trigger.isUpdate){
        
    }
}