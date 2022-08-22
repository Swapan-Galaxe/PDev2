// Check a checkbox only when an Opp is changed to Closed Won!
trigger Winning on Opportunity (before update) {
  for (Opportunity opp : Trigger.new) {
    Opportunity oldOpp = Trigger.oldMap.get(opp.Id);
    Boolean oldOppIsWon = oldOpp.StageName.equals('Closed Won');
    Boolean newOppIsWon = opp.StageName.equals('Closed Won');
    if (!oldOppIsWon && newOppIsWon) {
      opp.I_am_Awesome__c = true;
    }
  }
}