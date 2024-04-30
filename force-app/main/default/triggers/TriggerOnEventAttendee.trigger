trigger TriggerOnEventAttendee on Event_Attendee__c (after insert) {
    if(Trigger.isafter && Trigger.isInsert){
        EventAttendeeHandler.handleEventAttendee(Trigger.new);
    }

}