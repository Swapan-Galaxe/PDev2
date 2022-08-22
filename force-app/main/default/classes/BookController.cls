public with sharing class BookController {

    public String RemainderDate {get;set;}
    public Book__c book{get;set;}
    public Task task{get;set;}
    public transient String filterBusinessUnitControl { get; set; }     
       
    public BookController(ApexPages.StandardController controller)
    {
        book = new Book__c();
        task=[Select IsReminderSet, reminderdatetime from task limit 1];
    }

    public SelectOption[] getReminderTimeList() 
        {   
            string TaskReminderTime = '08:00';
            SelectOption[] options = new SelectOption[]{};
            String mins = '30';
           
            for (Integer i = 0; i < 48; i++) 
            {
                if(i <= 23)
                {
                    mins        = (mins == '30') ? '00' : '30';
                    Integer hrs = ((i*30) / 60);
                    String hr   = (string.valueOf(hrs).length() == 1) ? '0' + string.valueOf(hrs) : string.valueOf(hrs);           
                    String key = hr + ':' + mins + ' AM';
                    options.add(new SelectOption(key, key));
                }
                if(i > 23)
                {
                    mins        = (mins == '30') ? '00' : '30';
                    Integer hrs = ((i*30) / 60);
                    String hr   = (string.valueOf(hrs).length() == 1) ? '0' + string.valueOf(hrs) : string.valueOf(hrs);           
                    String key = hr + ':' + mins + ' PM';
                    options.add(new SelectOption(key, key));
                }
            }
            return options;   
        }
        
        
        public void newsubmit() {
        try 
        {        
             string ss = filterBusinessUnitControl;
             System.debug(LoggingLevel.DEBUG,ss);
             task = new Task();
             System.debug(task.NewReminderDate__c);
        } 
        catch(Exception e)
        {
            System.debug('-----Exception -----' + e);
            ApexPages.AddMessage(new ApexPages.Message(ApexPages.Severity.ERROR,'System Error : Contact System Admin')); 
     }       
        
    }
    
    public void submit() {
        try {
        
           
            if(Book__c.BookName__c!=NULL) 
            {
                upsert(book) ;
                ApexPages.AddMessage(new ApexPages.Message(ApexPages.Severity.INFO,'Infomation Saved successfully')); 
            } 
            else 
            {
                ApexPages.AddMessage(new ApexPages.Message(ApexPages.Severity.ERROR,'Please Enter')); 
            }
        } 
        catch(Exception e)
        {
        System.debug('-----Exception -----' + e);
        ApexPages.AddMessage(new ApexPages.Message(ApexPages.Severity.ERROR,'System Error : Contact System Admin')); 
     }       
        
    }
}