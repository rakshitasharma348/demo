public class hahaha {
    public static void practice(){
        Map<Id,Contact> conMap=new Map<Id,Contact>();
        List<Contact> conList=[SELECT Id,  AccountId,Name FROM Contact WHERE AccountId != null ];
        for(Contact con:conList ){
            conMap.put(con.AccountId, con);
            
        }
        System.debug(conMap);        
        Map<Id,List<Contact>> abMap= new Map<Id, List<Contact>>();
        for(Contact con: conList){
            if(abMap.ContainsKey(con.AccountId)){
                abMap.get(con.AccountId).add(con);
            }
            else{
                list<Contact> contactList= new List<Contact>{con};
                abMap.put(con.AccountId,contactList );
            }
        }
        System.debug(abMap);
    }

}