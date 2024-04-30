trigger TriggerOnSessionAttendee on Session_Attendee__c (after insert, after update ){
    if(Trigger.isafter && (trigger.isupdate || Trigger.isInsert)){
        SessionAteendeeHandler.handleAfterUpdate(Trigger.new);
    }

}