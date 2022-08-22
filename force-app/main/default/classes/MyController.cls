global with sharing class MyController {
    
      public Book__c objBook{get;set;}
    
    public MyController(ApexPages.StandardController controller) 
    { 
    }
    
   public Book__c getBook() {
        objBook =  [SELECT BookName__c FROM Book__c
                WHERE Id = :ApexPages.currentPage().getParameters().get('Id')];
       return objBook;
    }
}