public class AddressSearchController {
    public static String getAddressSet(String SearchText){
        String APIKey = 'AIzaSyBiFJa5ejDMwiMv3TWin8STnUGvScI0t38';
        String result = null;
        system.debug('SearchText is ' + SearchText);
        try{
            if(SearchText != null){
                String APIUrl = 'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=' + SearchText.replace(' ', '%20') + '&key=' + APIKey; 
                system.debug('APIUrl is ' + APIUrl);
                HttpRequest req = new HttpRequest();
                req.setMethod('GET');
                req.setEndpoint(APIURL);
                Http http = new Http();
                HttpResponse res = http.send(req);
                Integer statusCode = res.getStatusCode();
                system.debug('statusCode is ' + statusCode);
                if(statusCode == 200){
                    system.debug('API invoked successfully');
                    result = res.getBody();
                    system.debug(result);
                }
            }
        }
        catch(exception e){
            //Handling exception
            system.debug(e.getMessage());
        }
        return result;
    }

}