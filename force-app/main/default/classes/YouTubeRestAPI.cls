@RestResource(urlMapping='/api/YouTubeChannelDetails/*')
global with sharing class YouTubeRestAPI {

    @HttpGet
    global static string doGet() {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://www.googleapis.com/youtube/v3/channels?part=snippet%2CcontentDetails%2Cstatistics&id=<ID>&key=<API_KEY>');
        request.setMethod('GET');
        
        HttpResponse response = http.send(request);
        List<Object> lstObj = new List<Object>();
        if(response.getStatusCode() == 200) {
            // Deserialize the JSON string
        
            Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
        
            lstObj = (List<Object>) results.get('items');
            System.debug('Received the following ELEMENT_NAME:');
        
            for(Object obj: lstObj) {
                System.debug(obj);
            }
        }
        
        return 'executed';
    }
}
