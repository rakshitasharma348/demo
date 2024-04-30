public class PaymentTriggerHandler {
    @future(Callout=true)
    public static void handle( List<Id> pIds){
        String accessToken = 'Bearer sk_test_51OZBiySHI1QJK6jTlbHsRodgXW7fZSwqqAYnD2ESjouaL1CCFHdQ6LlQR8uHzD2dl8pfqjQjLoexcSJ4Or1HzVnL00wDHkmIpw';        
        HttpRequest request = new HttpRequest();
        Http http = new Http();   
        
        request.setMethod('POST'); 
        request.setHeader('Authorization',accessToken);   
        request.setEndpoint('https://api.stripe.com/v1/payment_intents');
        List<Payment__c> pList= [SELECT Account__r.CustomerId__c,PaymntId__c, CurrencyCode__c,Amount__c FROM Payment__c WHERE ID IN:pIds];
        Payment__c pc=pList[0];
        String body ='amount='+pc.Amount__c+'&currency='+pc.CurrencyCode__c+'&automatic_payment_methods[enabled]=true';                                                 
        request.setBody(body);
        HttpResponse  response = http.send(request);
        if(response.getStatusCode()==200){
            System.debug(response.toString());
            System.debug( 'Status' +response.getStatus());
            System.debug(response.getStatusCode());
            System.debug( response.getBody());
        }
        map<String, Object> responseMap= (Map<String, Object>)JSON.deserializeUntyped(response.getBody());
        String ids= (String) responseMap.get('id');
        Payment__c pcc= new Payment__c(Id=pIds[0], ChargeId__c=ids);
        update pcc;
    }                                                        
}