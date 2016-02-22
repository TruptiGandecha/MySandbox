@isTest
public class Test_CountContactController {

    static testMethod void insertcontacts() {
  
    List<Account> accountsList = new List<Account>{};
    List<Contact> contactList = new List<Contact>{};
    
        Account a = new Account(Name = 'Test Account ');
        accountsList.add(a);
        
        Account b = new Account(Name = 'Test Account 2');
        accountsList.add(b);
        
        if(!accountsList.isEmpty()){
        insert accountsList;
        }
        
        Contact c = new Contact(FirstName = 'Kunti',LastName ='Patel',AccountId=accountsList[0].Id);
        contactList.add(c);
        
        Contact con = new Contact(FirstName = 'Tiger',LastName ='Shroff',AccountId=accountsList[1].Id);
        contactList.add(con);
               
        test.startTest();
        insert contactList;
        Account acc  = [SELECT Id,CountOfContacts__c FROM Account WHERE Id=:a.Id];
        System.assertEquals(acc.CountOfContacts__c,1);
        delete contactList;
        test.stopTest();
        
         
  }
}