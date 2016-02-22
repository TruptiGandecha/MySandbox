/*
 * $Author:      $ Trupti
 * $Description: $ This class is used to count the number of contacts for an account
 * $Date:        $ 15th Oct 2015
 * $Revision:    $
 */
 public class CountContactController{
         public List<Contact> contactList;
         
         public static void insertContacts(List <Contact> newContactList){
         //The method on contact insertion updates the CountOfContacts__c field on Account Object
         List <Id> accIds = new List <Id> ();
         Integer count = 0;
        
         Set<Account> accSet = new Set<Account>();
         Set<String> DuplicateRecordSet = new Set<String>();   
         List<Account> accountList = new List<Account> ();
         Map<Id,Account> accountConMap = new Map<Id,Account>();
         List<Account> accUpdateList = new List<Account>();
             
        for (Contact con: newContactList)
        {    
            accIds.add(con.AccountID);
        }
                             
        accountList = [SELECT Id,CountOfContacts__c FROM ACCOUNT WHERE ID IN: accIds];
             
        if(!accountList.isEmpty() && accountList.size()>0){ 
        
            for(Integer i=0;i<newContactList.size();i++){
            
                for(Account acc:accountList){
                if(newContactList[i].AccountId != acc.Id){
                continue;
                }
                count = Integer.ValueOf(acc.CountOfContacts__c);
                count++;            
                acc.CountOfContacts__c = count;
                    
                accountConMap.put(acc.Id,acc);
                    
                    if(DuplicateRecordSet.isEmpty()){
                    DuplicateRecordSet.add(acc.Id);    
                    accSet.add(accountConMap.get(acc.Id));
                    }
                    else if(!(DuplicateRecordSet.contains(acc.Id))){
                    DuplicateRecordSet.add(acc.Id);
                    accSet.add(accountConMap.get(acc.Id));    
                    }
                }
            }
            accUpdateList.addAll(accSet);
            update accUpdateList;
        }
        }
        
        public static void deleteContacts(List <Contact> newContactList){
        List <Id> accIds = new List <Id> ();
        Integer count = 0;

        Set<Account> accSet = new Set<Account>();
        Set<String> DuplicateRecordSet = new Set<String>();   
        List<Account> accountList = new List<Account> ();
        Map<Id,Account> accountConMap = new Map<Id,Account>();
        List<Account> accUpdateList = new List<Account>();
             
        for (Contact con: newContactList)
        {    
            accIds.add(con.AccountID); 
        }
             
         accountList = [SELECT Id,CountOfContacts__c FROM ACCOUNT WHERE ID IN: accIds];
             
         if(!accountList.isEmpty() && accountList.size()>0){
             for(Integer i=0;i<newContactList.size();i++){
                 for(Account acc:AccountList){
                 if(newContactList[i].AccountId != acc.Id){
                 continue;
                 }       
                     count = Integer.ValueOf(acc.CountOfContacts__c);
                     count --;  
                     acc.CountOfContacts__c = count;
                          
                     accountConMap.put(acc.Id,acc);
                    
                    if(DuplicateRecordSet.isEmpty()){
                        DuplicateRecordSet.add(acc.Id);    
                        accSet.add(accountConMap.get(acc.Id));
                    }
                    else if(!(DuplicateRecordSet.contains(acc.Id))){
                        DuplicateRecordSet.add(acc.Id);
                        accSet.add(accountConMap.get(acc.Id));    
                    }
                 }
             }
         accUpdateList.addAll(accSet);
         update accUpdateList;
         }
    }
}