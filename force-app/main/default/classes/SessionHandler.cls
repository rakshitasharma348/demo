public class SessionHandler {
        public static void handleUpdates(List<Session__c> updatedSessions, Map<Id, Session__c> oldSessionsMap) {
        List<Event__c> eventsToUpdate = new List<Event__c>();

        for (Session__c updatedSession : updatedSessions) {
            Session__c oldSession = oldSessionsMap.get(updatedSession.Id);

            if ((oldSession.Start_Date__c != updatedSession.Start_Date__c) ||
                (oldSession.End_Date_Time__c != updatedSession.End_Date_Time__c)) {
                Event__c relatedEvent = new Event__c(
                    Id = updatedSession.Event__c,
                    Start_Date__c = updatedSession.Start_Date__c	,
                    EndDate__c	 = updatedSession.End_Date_Time__c
                );
                eventsToUpdate.add(relatedEvent);
            }
        }

        if (!eventsToUpdate.isEmpty()) {
            update eventsToUpdate;
        }
    }
    public static void handleDeletes(List<Session__c> deletedSessions) {
        Set<Id> eventIdsToDelete = new Set<Id>();
        for (Session__c deletedSession : deletedSessions) {
            if (deletedSession.Event__c != null) {
                eventIdsToDelete.add(deletedSession.Event__c);
            }
        }
        if (!eventIdsToDelete.isEmpty()) {
            delete [SELECT Id FROM Event__c WHERE Id IN :eventIdsToDelete];
        }
    }
}