public class EventHandler {
        public static void handleEvent(List<Event__c> newEvents){
        List<Session__c> SessionToInsert= new List<Session__c>();
        Id singleSessionId=[SELECT Id FROM RecordType WHERE SobjectType='Event__c' AND DeveloperName= 'Single_Session_Event'].Id;
        Id multipleSessionId= [SELECT Id FROM RecordType WHERE SobjectType='Event__c' AND DeveloperName= 'Multiple_Session_Event'].Id;
        for(Event__c newEvent: newEvents){
            if(newEvent.RecordTypeId == singleSessionId){ 
                Session__c	newSession = new Session__c(
                    Name=newEvent.Name,
                    Start_Date__c= newEvent.Start_Date__c,
                    End_Date_Time__c = newEvent.EndDate__c,	
                    Capacity__c	 = newEvent.Capacity__c,
                    Event__c     = newEvent.Id);
                SessionToInsert.add(newSession);
                }
            else if(newEvent.RecordTypeId==multipleSessionId){
                Session__c	newSession1 = new Session__c(
                    Name=newEvent.Name +'Session1',
                    Capacity__c	 = newEvent.Capacity__c/2,
                    Event__c     = newEvent.Id);
                Session__c	newSession2 = new Session__c(
                    Name=newEvent.Name +'Session2',
                    Capacity__c	 = newEvent.Capacity__c/2,
                    Event__c     = newEvent.Id);
                SessionToInsert.add(newSession1);
                SessionToInsert.add(newSession2);
            }
        }
        if(!SessionToInsert.isEmpty()){
            insert SessionToInsert;
        }
    }
}