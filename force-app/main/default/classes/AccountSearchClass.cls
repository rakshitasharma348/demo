public  class AccountSearchClass {
    @AuraEnabled
    public static List<Account>searchAccount(String KeyWord){
        String searchVal= '%'+KeyWord+'%';
        return[Select Id, name, Phone, Type from Account where Name LIKE :searchVal];
    }

}