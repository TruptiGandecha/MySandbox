public with sharing class LifeSport{

    public String var {get; set;}
    
    public User u{get;set;}
    public boolean render{get;set;}
    public List<User> userList = new List<User>();
    public List<User> userDetails = new List<User>();
    
    public LifeSport(){
        render=false;
        Id uid = userinfo.getUserId();
        
        u = [Select Id,Name,Email,Profile.Name,Title,CompanyName,MobilePhone from User Where Id=:uid]; 
    }
    
    public User getUserDetails() {
    return u;
    }
    public PageReference Save() {
        render =true;
        update u;
        return null;
    } 
    public List<SelectOption> getUserList() 
    {
        List<SelectOption> userList = new List<SelectOption>();
        for(User  usr:[Select Id,Name from User LImit 200]){
        userList.add(new SelectOption(usr.Id,usr.name));
        }
        
        if(!userList.isEmpty()){
        userDetails = [Select Id,Name,Email,MobilePhone,CompanyName,Title from User LImit 200];
        }
        return userList;
    }
    
}