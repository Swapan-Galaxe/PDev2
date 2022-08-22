public class WinningOppChecker {
  // These variables store Trigger.oldMap and Trigger.newMap
  Map<Id, Opportunity> oldOpps;
  Map<Id, Opportunity> newOpps;
  
  // This is the constructor
  // A map of the old and new records is expected as inputs
  public WinningOppChecker(
    Map<Id, Opportunity> oldTriggerOpps, 
    Map<Id, Opportunity> newTriggerOpps) {
      oldOpps = oldTriggerOpps;
      newOpps = newTriggerOpps;
  }
  
  // The one method your master trigger will call
  public void checkWinningOpps() {
    for (Opportunity newOpp : newOpps.values()) {
      Opportunity oldOpp  = oldOpps.get(newOpp.Id);
      Boolean oldOppIsWon = oldOpp.StageName.equals('Closed Won');
      Boolean newOppIsWon = newOpp.StageName.equals('Closed Won');
      if (!oldOppIsWon && newOppIsWon) {
        newOpp.I_am_Awesome__c = true;
      }
    }
  }
}