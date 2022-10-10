/*
When ever Opportunity "Stage" is modified to "Closed Won" then set "Close Date" 
as "Today Date" and "Type" as "New Customer".
*/
trigger OpporUpdate on Opportunity (before update) {     
    Map<Id,Opportunity> oppOld = Trigger.oldMap;     
    Map<Id,Opportunity> oppNew = Trigger.newMap;     
    Set<Id> keys =oppOld.keySet();
     
    for(Id rid :keys){         
        Opportunity oldOpportunity = oppOld.get(rid);         
        Opportunity newOpportunity = oppNew.get(rid);         
        if(oldOpportunity.stagename!='Closed Won' && newOpportunity.stagename=='Closed Won'){             
            newOpportunity.closeDate=System.today();             
            newOpportunity.type='New Customer';             
        }         
    }     
}

/*when a new contact is created for a existing account 
then set contact otherphone as account phone
trigger ContactAccountRelation on Contact (before insert) {
     
    Set<Id> accIdSet = new Set<Id>();
     
    for(Contact con : trigger.new){
        if(String.isNotBlank(con.AccountId)){
            accIdSet.add(con.AccountId);
        }
    }
     
    if(accIdSet.size() > 0){
        Map<Id,Account> accMap = new Map<Id,Account>([Select Id, Phone From Account where id In:accIdSet]);
         
        for(Contact con : trigger.new){
            if(con.AccountId != null && accMap.containskey(con.AccountId)){
                if(accMap.get(con.AccountId).Phone != null){
                    con.OtherPhone = accMap.get(con.AccountId).Phone;
                }
            }
        }
         
    }
}*/

/*Write a trigger in which if an account that has related contacts and the user tries to 
delete that account it throws you an error "Account cannot be deleted".
trigger PreventAccountFromDeletion on Account (before delete){
     
    List<account> accList = new List<account>();  
    Set<id> accIdSet = new Set<id>();  
    for(Account acc : Trigger.old)  
    {  
        accIdSet.add(acc.id);  
    }  
   
 Map<Id, Account> accts = new Map<Id, Account>([Select Id, (Select Id from contacts) from Account where id in :accIdSet]);
     
    for(Account acc : Trigger.old)
    {
        if(accts.get(acc.id).contacts.size()>0)
        {
            acc.adderror('Account cannot be deleted');
        }
    }                                       
     
}*/

/*
public class GetProductQuantity {
    public static void GetToatlProductQty(){        
        List<account> AccList = [select id,Name from Account where Working_in__c = 'ASIA'];        
        //system.debug('ACCCC'+AccList);        
        if(AccList.size()>0){            
            List<Opportunity> oppList =[select id,TotalOpportunityQuantity,AccountId from Opportunity where AccountId IN: AccList AND StageName='Closed Won'];            
            //system.debug('opp'+oppList);            
            for(Opportunity opp:oppList){                
                System.debug('ACCOUNT'+opp.AccountId+'Number Of Product Sol'+opp.TotalOpportunityQuantity);            
            }        
        }    
    } 
     
}*/