public with sharing class DropboxController {
  
    public static void uploadFileByRecord(string recordId)
    {
        List<ContentDocumentLink> links=[SELECT ContentDocumentId,LinkedEntityId FROM ContentDocumentLink where LinkedEntityId=:recordId];
        Set<Id> ids=new Set<Id>();
        for(ContentDocumentLink link:links)
        {
            ids.add(link.ContentDocumentId);
        }
        List<ContentVersion> versions=[SELECT VersionData,Title,ContentDocumentId,FileExtension FROM ContentVersion WHERE ContentDocumentId = :ids AND IsLatest = true];
        
        for(ContentVersion attach:versions)
        {
            try
            {
                string fileUrl=DropboxService.upload(attach);
               	if (string.isNotBlank(fileUrl)) 
                {
                    //Store Information in Object
                    //Will be used for retrieving files
                    //FileStore__c fileStore=new FileStore__c();
                    //fileStore.ServerUrl__c=fileUrl;
                    //fileStore.Name=attach.Title+'.'+  attach.FileExtension.toLowerCase();
                   // fileStore.RecordId__c=recordId;
                    //fileStore.FileExtension__c=attach.FileExtension.toLowerCase();
                    //insert fileStore;
                }
            }
            catch(Exception ex)
            {
               throw new BaseException(ex);
            }
        }
    }
}
