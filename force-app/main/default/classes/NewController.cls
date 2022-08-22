global with sharing class NewController {
     
    //used to get a hold of the account record selected for deletion
	public string SelectedAccountId { get; set; }
    
    public List<Account> accounts { get; set; }

    public NewController() {
      LoadData();
    }
    
    private void LoadData() {
          Id id = ApexPages.currentPage().getParameters().get('id');
    	accounts = [SELECT Name, Phone, Industry, Website FROM Account];
    }
    
    public void DeleteAccount()
    {
        // if for any reason we are missing the reference
        if (SelectedAccountId == null) {        
        	return;
        }
        
        // find the account record within the collection
        Account tobeDeleted = null;
        for(Account a : accounts)
            if (a.Id == SelectedAccountId) 
        {
            tobeDeleted = a;
            break;
        }
        
        //if account record found delete it
        if (tobeDeleted != null) {
            Delete tobeDeleted;
        }
        
        //refresh the data
        LoadData();
    }
}