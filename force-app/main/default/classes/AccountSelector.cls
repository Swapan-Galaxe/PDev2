public with sharing class AccountSelector {
   
    @AuraEnabled(cacheable=true)
	public static List<Account> getAccount()
    {
        return [Select Id,Name,Website,phone,Email__c from Account where BillingStreet!=null];
    }
    @AuraEnabled(cacheable=true)
    public static List<Account> getById(string acctid)
    {
        return [Select Id,Name,BillingStreet,BillingCity,BillingState,BillingPostalCode,BillingCountry from Account where id=:acctid];
    }
}
