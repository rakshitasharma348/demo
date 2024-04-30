public with sharing class ExamContactHandler {
    public static void  handleInsert(List<Contact> newContact){
        List<User> userList = new List<User>();
        Set<Id> contactIds= new Set<Id> ();
        for(Contact con:newContact){
            contactIds.add(con.Id);
            System.debug(con.Id);
        }

        for(Contact con:newContact){
           User newuser=new User();
           newuser.Firstname=con.FirstName;
           newuser.Lastname=con.LastName;
           newuser.Title=con.Title;
           newuser.MobilePhone=con.MobilePhone;
           newuser.Phone=con.Phone;
           newuser.SenderEmail=con.Email; 
           userList.add(newuser);    
        }
        if(!userList.isEmpty()){
        insert userList;
        }

    }
    public static void  handleUpdate(List<Contact> newContact ){
        List<User> userListSecond = new List<User>();
        Set<Id> contactIds= new Set<Id> ();
        for(Contact con:newContact){
            contactIds.add(con.Id);
            System.debug(con.Id);
        }
        List<User> uuulist=[Select Id,Firstname,Lastname,Title,MobilePhone,Phone,Email,ContactId from User WHERE ContactId In:contactIds];
        Map<Id, User> userMap= new Map<Id, User > ( [Select Id,Firstname,Lastname,Title,MobilePhone,Phone,Email,ContactId from User WHERE ContactId In:contactIds]);
       List<Contact> userContactList=[Select Id,(Select Id, ContactId,Firstname, Lastname,Title,MobilePhone,Phone,Email from Users) from Contact WHERE Id In:contactIds];
       Map<iD,iD> contactToUserIdMap = new Map<iD,iD>();
       for(User u:uuulist){
        contactToUserIdMap.put(u.ContactId,u.Id);
       }
        for(Contact con:newContact){

            if(contactToUserIdMap.containsKey(con.Id)){
              Id userId= contactToUserIdMap.get(con.Id);
                User newuser=new User();
                newuser.Id = userId;
                newuser.Firstname=con.Firstname;
                newuser.Lastname=con.Lastname;
                newuser.Title=con.Title;
                newuser.MobilePhone=con.MobilePhone;
                newuser.Phone=con.Phone;
                newuser.SenderEmail=con.Email;
                userListSecond.add(newuser);
            }
            if(!userListSecond.isEmpty()){
                update userListSecond;
                }
        }
    }
}