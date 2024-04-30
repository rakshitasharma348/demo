trigger ContactCustomTrigger on Contact (after insert) {
    List<Account> newList = new List<Account>();
    for(Contact con:Trigger.new){
        if( con.AccountId==null){
            Account acc= new Account();
            acc.Name= con.LastName;
            newList.add(acc);
        }
    }
        if(!newList.isEmpty()){
            insert newList;
        
    }
}