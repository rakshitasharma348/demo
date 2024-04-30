trigger ContactTrigger on Contact (after insert , after update) {
    if(Trigger.isAfter){
        if(Trigger.isInsert){
            ExamContactHandler.handleInsert( Trigger.new);
        }
        if(Trigger.isUpdate){
            ExamContactHandler.handleUpdate(Trigger.new);
        }
    }


}