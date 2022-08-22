trigger ContactsCreation on Account (after insert) {     
    list<contact> listContact = new list<contact>();     
    map<id,decimal> mapAcc = new map<id,decimal>();     
    for(Account acc:trigger.new){         
        mapAcc.put(acc.id,acc.NumberofLocations__c);         
    }
     
    if(mapAcc.size()>0 && mapAcc!=null){         
        for(Id accId:mapAcc.keyset()){             
            for(integer i=0;i<mapAcc.get(accId);i++){                 
                contact newContact=new contact();                 
                newContact.accountid=accId;                 
                newContact.lastname='contact'+i;                 
                listContact.add(newContact);                 
            }             
        }         
    }
     
    if(listContact.size()>0 && listContact!=null)         
        insert listContact;     
}