global with sharing   class OpenActivitiesController {
    
    public string SelectedTaskId { get; set; }
    public Id partnerleadId{get;set;}
    public List<Task> tasks { get; set; }
	public List<Partner_Lead__c> leads { get; set; }
    
    public OpenActivitiesController(ApexPages.StandardController controller) 
    {
 	  LoadPartnerLead();
      LoadTasks();
    }
    
    private void LoadPartnerLead()
    {
        partnerleadId = ApexPages.currentPage().getParameters().get('id');
        leads = [SELECT CreatedById,Id,LastModifiedDate,Lead_Name__c,Name,OwnerId,Phone__c FROM Partner_Lead__c WHERE Id = :partnerleadId];
    }
    
    private void LoadTasks() {
         partnerleadId = ApexPages.currentPage().getParameters().get('id');
        tasks = [SELECT Id,Description,Subject,CreatedByID,Status,WhatId,WhoId,Partner_Lead__c  FROM Task WHERE Partner_Lead__c = :partnerleadId and Status != 'Completed'];
    }
    
    public void DeleteTask()
    {
        // if for any reason we are missing the reference
        if (SelectedTaskId == null) {        
            return;
        }
        
        // find the task record within the collection
        Task tobeDeleted = null;
        for(Task a : tasks)
            if (a.Id == SelectedTaskId) 
        {
            tobeDeleted = a;
            break;
        }
        
        //if task record found delete it
        if (tobeDeleted != null) {
            Delete tobeDeleted;
        }
        
        //refresh the data
        LoadTasks();
    }
}