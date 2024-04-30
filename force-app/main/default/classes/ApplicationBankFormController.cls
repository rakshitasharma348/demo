public With Sharing class ApplicationBankFormController {
    @AuraEnabled
    public static void createContact(String data) {        
        BankDataWrapper wrapper = (BankDataWrapper)JSON.deserialize(data,BankDataWrapper.class);
        if(wrapper != NULL) {
            BankAccount__c bamkAcc=new  BankAccount__c(
            Name=wrapper.Name,
            Account_Type__c=wrapper.Account_Type,
            Address__c=wrapper.Address,
            ChecquBookType__c=wrapper.ChecquBookType,
            Email__c=wrapper.Email,
            Phone__c=wrapper.Phone,
            TotalAmount__c=wrapper.TotalAmount               
            );
        
            if(bamkAcc != NULL) {
            INSERT bamkAcc;
        }
        
}
}
}