public with sharing class jQueryDataTableCtrl {
@AuraEnabled
   public static list <Opportunity> fetchOpportunity() {
      Return [SELECT Name,Type,StageName,Amount,CloseDate FROM Opportunity LIMIT 500];
          
    }
}