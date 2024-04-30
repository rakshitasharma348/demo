public class EventAttendeeHandler {
    public static void handleEventAttendee(List<Event_Attendee__c> newEventAttendees) {
        List<Session_Attendee__c> sessionAttendeesToInsert = new List<Session_Attendee__c>();
        Map<Id, Id> eventToRecordMap = new Map<Id, Id>();
        Map<Id,Id> eventToSessionMap = new Map<Id, Id>();
        Set<Id> eventIds = new Set<Id>();
         Id SingleSessionId=[SELECT Id FROM RecordType WHERE SobjectType='Event__c' AND DeveloperName= 'Single_Session_Event'].Id;

        for (Event_Attendee__c newEventAttendee : newEventAttendees) {
            eventIds.add(newEventAttendee.Event__c);
        }
        for(Event__c eventRecord:[SELECT Id,RecordTypeId FROM Event__c WHERE Id IN: eventIds ]){
            eventToRecordMap.put(eventRecord.Id, eventRecord.RecordTypeId); 
        }
        List<Session__c> Session=[SELECT Id,Event__c FROM Session__c WHERE Event__c IN: eventIds ];
        for(Session__c newSession :Session){
            eventToSessionMap.put(newSession.Event__c,newSession.Id);
        }
           for (Event_Attendee__c newEventAttendee : newEventAttendees) {
            if (eventToRecordMap.ContainsKey(newEventAttendee.Event__c) &&eventToRecordMap.get(newEventAttendee.Event__c)== SingleSessionId) {
               
                Session_Attendee__c	 sessionAttendee = new Session_Attendee__c	(
                    Name=newEventAttendee.Name,
                    Session__c = eventToSessionMap.get(newEventAttendee.Event__c),
                    Event_Attendee__c = newEventAttendee.Id,
                    Email__c = newEventAttendee.Email__c,
                    Status__c = 'Registered'                  );
                sessionAttendeesToInsert.add(sessionAttendee);
            }
        }
        insert sessionAttendeesToInsert;
    }
}