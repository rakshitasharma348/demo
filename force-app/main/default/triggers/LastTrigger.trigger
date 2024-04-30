trigger LastTrigger on Task (before insert) {
    // Whenever a Task is Created , set priority to High
    if(Trigger.isInsert && Trigger.isBefore){
        for(Task taskRecord: Trigger.New){
            System.debug('Found Task Record');
            taskRecord.Priority='High';
        }
    }

}