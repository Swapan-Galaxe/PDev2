public with sharing class MessageController {
   
    @AuraEnabled
    public static MessageServiceBase.MessageResponse sendSMS(string mobileNumber, string message)
    {
        IMessageService service=new NexmoMessageService();
        MessageServiceBase.MessageRequest request=new MessageServiceBase.MessageRequest();
        request.toNumber=mobileNumber;
        request.fromNumber='919999743784';
        request.message=message;
        return service.sendSMS(request);
    }
}
