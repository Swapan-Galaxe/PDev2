@isTest
public with sharing class ContactServiceTest {

    @TestSetup
    static void makeData() {
        List<Contact> contacts = new List<Contact>();
        // Inserting 5 contacts
        for(Integer i=0; i<5; i++) {
            Contact contact = new Contact(FirstName='Test', LastName='Contact');
            contacts.add(contact);
        }
        insert contacts;
    }
    
     @isTest
    static void testGetContactIdAndNames() {
        Test.startTest();
        // Testing the API
        List<Contact> returnedContacts = ContactService.getContactIdAndNames(1);
        // Confirming the response
        System.assert(returnedContacts != null);
        System.assert(returnedContacts.size() == 1);
        System.assertEquals('Test Contact', returnedContacts[0].Name);
        Test.stopTest();
    }
    
}