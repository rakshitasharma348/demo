public class handleWebhookClass {
    // @future(callout=true)
    public static void webhookplay(){
        Http http = new Http();
        HTTPRequest request = new HTTPRequest();
        request.setEndpoint('https://api.brevo.com/v3/smtp/statistics/reports?limit=10&offset=0&sort=desc');
        request.setHeader('api-key',' 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');
        request.setHeader('accept',' application/json');
        
        request.setMethod('GET');
        // String body = '{"record21": {"ToAddress": "rakshitasharma348@gmail.com", "FromAddress": "sender21@example.com"}';
        // request.setBody(body);
        
        
        HttpResponse response = http.send(request);
        system.debug(response);
        // If the request is successful, parse the JSON response.
        system.debug(response.getStatusCode());
        if (response.getStatusCode() == 200) {
            system.debug(response.getStatusCode());
            // Deserialize the JSON string into collections of primitive data types.
            // Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
            system.debug(response.getStatusCode());
            // Cast the values in the 'animals' key as a list
            // Object word = results.get('id');
            // account.Customer_Id__c = String.valueOf(word);
            // accountData.add(account);
        }  
        else {
            System.debug('Error');
        }
    }
}