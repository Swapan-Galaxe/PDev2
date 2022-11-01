trigger UpdateSalesRep on account (before insert, before update) {

    Set<Id>setAccOwner=new Set<Id>();
    for(Account Acc: trigger.new)
    {
        setAccOwner.add(Acc.OwnerId);
    }
    Map<Id,User> User_map = new Map<Id,User>([select Name from User where id in:setAccOwner]);
    for(Account Acc: Trigger.new)
    {
        User usr=User_map.get(Acc.OwnerId);
        Acc.sales_Rep1__c=usr.Name;
    }
}

/* Whenever a created opportunity 
object record, update total opportunities and total amount in the account object.*/

trigger trgOppAcc on oppurtunity(after insert)
{
    Set<Id> oppids = new Set<Id>();
    for(Opportunity op : trigger.new)
    {
        oppids.add(op.id);
    }
    List<Account> listac = [select Total_opportunities__c,Total_Amount__c,(select id,Amount from Opportunities ) from account where id=:ids];
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