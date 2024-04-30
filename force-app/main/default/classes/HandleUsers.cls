public class HandleUsers {
    @AuraEnabled
    public static List<User> getUser(){
        return[SELECT Username FROM User WHERE IsActive = true];
        
    }

}