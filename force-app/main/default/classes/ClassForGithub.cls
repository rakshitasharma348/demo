public  class ClassForGithub {
    public static List<Account> handle(String inpName){
        //hii
        //hloo
        //firse hloo
        return [SELECT Id, IsDeleted, MasterRecordId, Name, Type, ParentId, BillingStreet, BillingCity, BillingState, BillingPostalCode FROM Account WHERE Name =: inpName Limit 1];
    }
    
}