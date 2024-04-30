trigger StripeTrigger on Account (after insert) {
    if(Trigger.isAfter && Trigger.isInsert ){        
        List<Id> accids= new List<Id>();
        accids.addAll(Trigger.newMap.keySet());
        AccTriggerHandler.handle(accids);
    }
}