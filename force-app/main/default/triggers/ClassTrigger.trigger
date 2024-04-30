trigger ClassTrigger on Class__c (after insert) {
 CollegeClassHandler.handleinsert(Trigger.newMap);
        
    }