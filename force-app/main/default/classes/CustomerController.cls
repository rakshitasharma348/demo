public class CustomerController {
    
    @AuraEnabled
    public static String createCustomer(String customerData) {
        Map<String, Object> customerMap = (Map<String, Object>) JSON.deserializeUntyped(customerData);

        
        Customer__c newCustomer = new Customer__c();

        newCustomer.Account_Type__c = (String) customerMap.get('AccountType');
        newCustomer.Name = (String) customerMap.get('CustomerName');

        if (newCustomer.Account_Type__c == 'Saving Account') {
            newCustomer.Account_Number__c = (String) customerMap.get('AccountNumber');
            newCustomer.Aadhar_Number__c = (String) customerMap.get('AadharNumber');
        } else if (newCustomer.Account_Type__c == 'Current Account') {
            newCustomer.PAN_Number__c = (String) customerMap.get('PANNumber');
            newCustomer.Account_Number__c = (String) customerMap.get('AccountNumber');
        } else if (newCustomer.Account_Type__c == 'Credit Card') {
            newCustomer.Credit_Card_Number__c = (String) customerMap.get('CreditCardNumber');
        }

        
        try {
            insert newCustomer;
            return newCustomer.Id;
        } catch (Exception e) {
            throw new AuraHandledException('Error creating customer: ' + e.getMessage());
        }
    }
}