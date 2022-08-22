trigger MasterOpportunityTrigger on Opportunity (
  before insert, after insert, 
  before update, after update, 
  before delete, after delete) {

  if (Trigger.isBefore) {
    if (Trigger.isInsert) { } 
    if (Trigger.isUpdate) {
      // This post's example implemented in our master trigger!
      WinningOppChecker checker = 
        new WinningOppChecker(Trigger.oldMap, Trigger.newMap);
      checker.checkWinningOpps();
      
      // Add other classes in your preferred execution order
     
    }
    if (Trigger.isDelete) { }
  }

  if (Trigger.IsAfter) {
    if (Trigger.isInsert) { } 
    if (Trigger.isUpdate) { }
    if (Trigger.isDelete) { }
  }
}