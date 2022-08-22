@RestResource(urlMapping='/v1/accounts/*')

global with sharing class REST_AccountService_V1
{
    @HttpGet
    global static AccountWrapper doGet()
    {
        RestRequest req= RestContext.request;
        RestResponse res= RestContext.response;
        
        AccountWrapper response=new AccountWrapper();
        String accountId= req.requestURI.substring(req.requestURI.lastindexOf('/')+1);
        
        List<Account> result= [Select Id, Name,Phone,BillingAddress  FROM Account WHERE Id =: accountId];
        
        if(result !=null && result.size()>0)
        {
            response.acc= result[0];
            response.status='Sucess';
        }
        else
        {
            response.acc=null;
            response.status='Error';
            response.message='Account not found';
            res.StatusCode=404;
        }
        
        return response;
    }
    
    global class AccountWrapper
    {
        public Account acc;
        public String status;
        public String message;
        
        public AccountWrapper(){}
    }

}