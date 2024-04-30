@RestResource(urlMapping='/getNotification/*')
global with Sharing class ExampleRestAPI {

    @HttpPost
    global static void doPost() {
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;
       
        
        try {
            
            Map<String, Object> payload = (Map<String, Object>) JSON.deserializeUntyped(req.requestBody.toString());
            System.debug(payload);
            
            String recipient = (String) payload.get('recipient');
            String subject = (String) payload.get('subject');
            String body = (String) payload.get('body');            
           
            res.statusCode = 200;
            res.responseBody = Blob.valueOf('Email sent successfully');
        } catch (Exception e) {
            
            System.debug('Exception occurred: ' + e.getMessage());
            
            
            res.statusCode = 500;
            res.responseBody = Blob.valueOf('Error processing webhook: ' + e.getMessage());
        }
    }
    
    @HttpGet
    global static void doGet(){
        
    }
}