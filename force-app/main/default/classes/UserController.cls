public without sharing class UserController 
{

public String selectedCountry{get;set;}
    public List<User> UserTemp = new List<User>();
    public   UserController(ApexPages.StandardController controller)
    {
     
    }
    String s = 'Canada';
 public String getString() {
        return s;
    }

    public void setString(String s) {
        this.s = s;
    }

    public List<SelectOption> UserList
    {
        get
        {
            UserTemp = [Select u.LastName, u.Id, u.FirstName, u.Email From User u order by u.ID limit 1];
            
            UserList = new List<SelectOption>();
            
            for(User temp : UserTemp)
            {
                UserList.add(new SelectOption(temp.Id, temp.LastName));
            }
            return UserList;
        }
        set;
    }
   

    String[] countries = new String[]{};

    public PageReference test() {
        return null;
    }
    public List<SelectOption> getItems() {
        List<SelectOption> options = new List<SelectOption>();
        options.add(new SelectOption('2','US'));
        options.add(new SelectOption('3','Canada'));
        options.add(new SelectOption('1','Mexico'));
        return options;
    }

    public String[] getCountries() {
        return countries;
    }

    public void setCountries(String[] countries) {
        this.countries = countries;
    
        

}


@AuraEnabled(cacheable=true)
public static List<Contact> getContactList() {
   List<Contact> lstContacts = [Select id, name, title, email, phone from contact limit 10];

    return lstContacts;
}

}