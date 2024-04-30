public class handleShippingAddressHandler {
    public static void handleInsert(List<Account> accList){
        for(Account acc:accList){
            if(acc.BillingStreet!=NULL){
              acc.ShippingStreet = acc.BillingStreet;   
            }
            if(acc.BillingCity!=NULL){
             acc.ShippingCity = acc.BillingCity; 
            }
            if(acc.BillingState!=NULL){
              acc.ShippingState= acc.BillingState;   
            }
            if(acc.BillingStreet!=NULL){
              acc.ShippingStreet = acc.BillingStreet;   
            }
            if(acc.BillingCountry!=NULL){
              acc.ShippingCountry = acc.BillingCountry;   
            }
           
            
        }  
    }
}