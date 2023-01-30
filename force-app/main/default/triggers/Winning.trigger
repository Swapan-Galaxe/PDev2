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

trigger accoppocount on account(after insert, after update)
{
  set<id> accids = new set<id>();
  for(account ac : trigger.new)
  {
      accids.add(ac.id);
  }

  List<Opportunity> opps  = new List<Opportunity>();
  List<Opportunity> lstoppold = trigger.oldmap;

  List<AggregateResult> oppsaggre = [select id, name, sum(totalAmountofRelatedOpp) totamount from Opportunity where id in :accids];


  for (Opportunity opp : Trigger.new) {

    Opportunity oldOpp = Trigger.oldMap.get(opp.Id);
    if(oldOpp.StageName != 'Closed Won' && opp.StageName == 'Closed Won')
    {
      opp.totalRecords += opp.totalRecords
      opps.add(opp);
    }
  }
  if(opps.size() > 0)
  {
    update opps
  }
}