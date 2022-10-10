
trigger trgDuplicateContact on Contact (before insert) {
    
    // Set to store email ids
    Set <String> emailSet = new Set<String>(); 
    // Set to store phone numbers
    Set <String> phoneSet = new Set<String>(); 
    
    // Iterate through each Contact and add their email and phone number to their respective Sets
    for (contact con:trigger.new) {
        emailSet.add(con.email);
        phoneSet.add(con.phone);
    }

    // New list to store the found email or phone numbers
    List <Contact> contactList = new List<Contact>();

    // Populating the list using SOQL
    contactlist = [SELECT email,phone FROM Contact WHERE email IN :emailSet OR phone IN :phoneSet];

    // Iterating through each Contact record to see if the same email or phone was found
    for (contact con:trigger.new) {
        If (contactList.size() > 0) {
            // Displaying the error
            con.email.adderror( 'Duplicate Contact Found. Use Existing Contact.' );
        }
    }

}