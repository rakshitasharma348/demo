public class SessionAteendeeHandler {
        public static void handleAfterUpdate(List<Session_Attendee__c> sessionAttendees) {
            List<Id> updatedEventAttendeeIds = new List<Id>();


            for (Session_Attendee__c sa : sessionAttendees) {
                if (sa.Status__c =='Attended'  ) {
                    updatedEventAttendeeIds.add(sa.Event_Attendee__c);
                }
            }
            List<Event_Attendee__c	> eventAttendeesToUpdate = [ SELECT Id ,Status__c  FROM Event_Attendee__c  WHERE Id IN :updatedEventAttendeeIds ];
            for (Event_Attendee__c	 ea : eventAttendeesToUpdate) {
                ea.Status__c ='Attended';
               
            }
            update eventAttendeesToUpdate;
        }
    }