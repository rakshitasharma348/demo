trigger LeadTrigger on Lead (before update) {
    if(Trigger.isBefore && Trigger.isUpdate){
       for(lead leadrec:Trigger.new){
         //   leadrec.Status='Working-Contacted';
        if(leadrec.Industry=='Healthcare'){
            leadrec.LeadSource='Purchased List';
            leadrec.SICCode__c='1100';
            leadrec.Primary__c='Yes';
        }
        }
    }

}