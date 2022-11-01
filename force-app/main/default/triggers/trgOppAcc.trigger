/* Whenever a created opportunity 
object record, update total opportunities and total amount in the account object.*/

trigger trgOppAcc on Opportunity(after insert)
{
    Set<Id> oppids = new Set<Id>();
    for(Opportunity op : trigger.new)
    {
        oppids.add(op.id);
    }
    List<Account> listac = [select Total_opportunities__c,Total_Amount__c,(select id,Amount from Opportunities ) from account where id in :oppids];
    for(account ac : listac)
    {
        a.Total_opportunities__c=a.opportunities.size();
        decimal sum = 0;
        for(opportunity p:a.opportunities)
        {
            sum=sum+p.amount;
        }
        a.Total_Amount__c=sum;
    }
    update ac;
}