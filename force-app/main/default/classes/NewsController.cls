public with sharing class NewsController {
    
    @AuraEnabled   
    public static Map<String,Object> retriveNews(String country,String category){
        HttpRequest httpRequest= new HttpRequest();
        httpRequest.setEndpoint('https://newsapi.org/v2/top-headlines?country='+country+'&category='+category+'&apiKey=547ce697da45434d82a4434e09091fc3');
        System.debug('yo');
        httpRequest.setMethod('GET');
        System.debug('yo');
        Map<String, Object> newsJsonData = new Map<String,Object>();
        String strResponse= null;

        try{
            http http= new http();
            HttpResponse httpResponse= http.send(httpRequest);
            if(httpResponse.getStatusCode()==200){
              strResponse=httpResponse.getBody();
              System.debug('chla chla');  
            }else{
                throw new CalloutException(httpResponse.getBody());
            }
        }catch(Exception ex){
            throw ex;
        }
        if(!String.isBlank(strResponse)){
          newsJsonData =(Map<String, Object>)JSON.deserializeUntyped(strResponse); 
        }
        if(!newsJsonData.isEmpty()){
            return newsJsonData;
        } else{
            return null;
        }
    }
}