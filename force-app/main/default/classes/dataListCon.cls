public class dataListCon {

	List<Account> accounts;

	public List<Account> getAccounts() {
		if(accounts == null) accounts = [SELECT Name, Phone, Industry, Website FROM Account LIMIT 10];
		return accounts;
	}

}