trigger AccountForContact on Contact (after insert) {
    List <Account> newList = new List<Account>();
    for(Contact con:trigger.new)
    {
        if(con.AccountId != null){
            Account acc = new Account(Id= con.AccountId, Contact_Created__c =true);
            newList.add(acc);
        }
    }
    if(!newList.isEmpty())
    {
        update newList;
    }

}