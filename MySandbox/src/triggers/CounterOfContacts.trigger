trigger CounterOfContacts on Contact (after Insert,after Delete) {
       
    if (Trigger.isInsert){
    
    CountContactController.insertContacts(Trigger.new);
    
    }
    if(Trigger.isDelete){
    
    CountContactController.deleteContacts(Trigger.old);
    
    }
}