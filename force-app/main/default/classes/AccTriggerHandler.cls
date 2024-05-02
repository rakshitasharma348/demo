public class AccTriggerHandler {
    @future(Callout=true)
//haaye haaye hoye hoye banjubindi banjubindi
    public static void handle( List<Id> accountIds){
//ding
        String accessToken = 'Bearer sk_test_51OZBiySHI1QJK6jTlbHsRodgXW7fZSwqqAYnD2ESjouaL1CCFHdQ6LlQR8uHzD2dl8pfqjQjLoexcSJ4Or1HzVnL00wDHkmIpw';        
        HttpRequest request = new HttpRequest();
        Http http = new Http();   
        
        request.setMethod('POST'); 
        request.setHeader('Authorization',accessToken);   
        request.setEndpoint('https://api.stripe.com/v1/customers');  
        List<Account> accountList= [SELECT Name, Email__c,Description FROM Account WHERE ID IN:accountIds];
        Account ac=accountList[0];
        String body = 'name='+ac.Name+'&email='+ac.Email__c+'&description='+ac.Description;                                                   
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
        Account	 acc= new Account(Id=accountIds[0], CustomerId__c=ids);
        update acc;
    }                                                        
}
