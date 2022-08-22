public with sharing class ToDoController {
    
    @AuraEnabled
	public static List<ToDo__c> loadData(){
        return [SELECT ID,Reminder_Date__c,Due_Date__c,Description__c FROM ToDo__c ORDER BY Due_Date__c ASC NULLS LAST];
    }
    
    //Method to save the record in database and return error message
    @AuraEnabled
    public static String saveTodoRecord(ToDo__c toDoRecord){
        String message;
        Database.saveResult sr = Database.insert(toDoRecord,false);
        if(!sr.isSuccess()){
            for(Database.error err : sr.getErrors()){
                message += err.getMessage();
            }
        }
        return message;
    }
    
    @AuraEnabled
     public static List<Contact> getContacts(){
        List<Contact> contactList = new List<Contact>();
        for(Contact oCon : [SELECT Id, Name, Email, Phone, MailingStreet, MailingCity, MailingState, MailingPostalCode, MailingCountry From Contact LIMIT 10]){
           contactList.add(oCon); 
        }
        return contactList;
    }
    
    @AuraEnabled
    public static List <Account> getAccounts() {
        List<Account> accountList = new List<Account>();
        for(Account Acc : [SELECT  Name, Industry, Type, VIP_Account__c FROM Account ORDER BY LastModifiedDate DESC LIMIT 20]){
            accountList.add(Acc);
        }
        return accountList;
    }
    
     @AuraEnabled
    public static List < sObject > fetchLookUpValues(String searchKeyWord, String ObjectName, List<sObject> ExcludeitemsList) {
        String searchKey = '%' + searchKeyWord + '%';
        List < sObject > returnList = new List < sObject > ();
 
        List<string> lstExcludeitems = new List<string>();
        for(sObject item : ExcludeitemsList ){
            lstExcludeitems.add(item.id);
        }
        
        // Create a Dynamic SOQL Query For Fetch Record List with LIMIT 5 and exclude already selected records  
        String sQuery =  'select id, Name from ' +ObjectName + ' where Name LIKE: searchKey AND Id NOT IN : lstExcludeitems order by createdDate DESC limit 5';
        List < sObject > lstOfRecords = Database.query(sQuery);
        
        for (sObject obj: lstOfRecords) {
            returnList.add(obj);
        }
        return returnList;
    }
    
    //file upload functions
    //
    @AuraEnabled
    public static Id saveChunk(Id parentId, String fileName, String base64Data, String contentType, String fileId) {
        // check if fileId id ''(Always blank in first chunk), then call the saveTheFile method,
        //  which is save the check data and return the attachemnt Id after insert, 
        //  next time (in else) we are call the appentTOFile() method
        //   for update the attachment with reamins chunks   
        if (fileId == '') {
            fileId = saveTheFile(parentId, fileName, base64Data, contentType);
        } else {
            appendToFile(fileId, base64Data);
        }
 
        return Id.valueOf(fileId);
    }
 
    public static Id saveTheFile(Id parentId, String fileName, String base64Data, String contentType) {
        base64Data = EncodingUtil.urlDecode(base64Data, 'UTF-8');
 
        Attachment oAttachment = new Attachment();
        oAttachment.parentId = parentId;
 
        oAttachment.Body = EncodingUtil.base64Decode(base64Data);
        oAttachment.Name = fileName;
        oAttachment.ContentType = contentType;
 
        insert oAttachment;
 
        return oAttachment.Id;
    }
 
    private static void appendToFile(Id fileId, String base64Data) {
        base64Data = EncodingUtil.urlDecode(base64Data, 'UTF-8');
 
        Attachment a = [
            SELECT Id, Body
            FROM Attachment
            WHERE Id =: fileId
        ];
 
        String existingBody = EncodingUtil.base64Encode(a.Body);
 
        a.Body = EncodingUtil.base64Decode(existingBody + base64Data);
 
        update a;
    }
}