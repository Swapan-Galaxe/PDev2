global with sharing   class TaskController {
 //used to get a hold of the account record selected for deletion
    public string SelectedTaskId { get; set; }
    
    public List<Task> tasks { get; set; }

    public TaskController(ApexPages.StandardController controller) {
 
      LoadData();
    }
    
    private void LoadData() {
          Id id = ApexPages.currentPage().getParameters().get('id');
        tasks = [SELECT Id,Description,Subject,CreatedByID,Status,WhatId,WhoId,Partner_Lead__c FROM Task WHERE Partner_Lead__c = :id and Status = 'Completed'];
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
        LoadData();
    }
}