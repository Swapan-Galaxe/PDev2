@RestResource(urlMapping='/User/*')
global with sharing class MyRestResource {

    
    @HttpGet
    global static User doGet() {
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;
        String Id = req.requestURI.substring(req.requestURI.lastIndexOf('/')+1);
        User result = [SELECT Id, Name, Phone FROM User Where Id = :Id];
        return result;
    }
}