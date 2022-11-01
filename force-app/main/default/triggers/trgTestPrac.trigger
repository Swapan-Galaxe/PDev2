trigger trgTestPrac on Account (before insert) {

    //Running a query to grab some sample accounts for the demonstration
    Map<Id, Account> accountsMap = new Map<Id, Account>([SELECT Id FROM Account LIMIT 100]);

    //Now to convert to a List we simply use the values() method
    List<Account> accounts = accountsMap.values();
    Set<Id> accIds = accountsMap.keySet();

    //Now we loop over the map by using the values() method
    Set<String> accountNames = new Set<String>();

    for(Account a : accountsMap.values()){
        accountNames.add(a.Name);
    }

    //How to Retrieve All Ids From Apex Map
    //This is for illustration purposes, technically we could've used a sub-query above.
    List<Contact> contacts = [SELECT Id FROM Contact WHERE AccountId IN: accountsMap.keySet()];

    //getting value from map based on key
    for(ID a : accountsMap.keySet())
    {
        if(accountsMap.get(a.Id) == '1234')
        {
            system.debug(a);
        }
    }
}