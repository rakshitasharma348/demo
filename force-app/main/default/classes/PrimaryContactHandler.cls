public class PrimaryContactHandler
{
    public static void handlePrimaryContact(List<contact> newContacts){
        List <Account> updateAccount= new List<Account>();
        for(Contact con: newContacts){
            if(con.Is_Primary__c==true){
                Account acc= [SELECT Id, Primary_Contact__c	 From Account WHERE Id =: con.AccountId Limit 1] ;
                if(acc!=null){
                    acc.Primary_Contact__c=con.Id;
                    updateAccount.add(acc);          
                }     
                }
            }
        if(!updateAccount.isEmpty()){
            update updateAccount;
        }
        }
        
    }