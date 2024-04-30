/*
class Name:TransactionTrigger
Class Desc:handle BAn ACCount and Transaction1
Class Created Date:
Devloped By:Rakshita Sharma
*/
public class TransactionTrigger {
    
    public static void handleInsert(List<Transaction__c> newTransactions){
        Set<Id> bankAccountIds= new Set<Id>();
        List<BankAccount__c> accountToUpdate= new List<BankAccount__c>();
        
        
        for(Transaction__c trans:newTransactions){
            bankAccountIds.add(trans.BankAccount__c);
        }
        
        Map<Id, BankAccount__c>idToBankMap= new Map<Id, BankAccount__c>([SELECT Id,TotalAmount__c FROM BankAccount__c WHERE ID IN:bankAccountIds]);
        for(Transaction__c trans: newTransactions)
        {
            if( trans.Type__c=='Debit'){
                if(idToBankMap.containsKey(trans.BankAccount__c)){
                    Date today = Date.today();                    
                    trans.Name= 'Dr-'+ today;//remove time
                    Decimal newTotalAmount = idToBankMap.get(trans.BankAccount__c).TotalAmount__c -trans.Amount__c;
                    if(newTotalAmount<= 1000){
                        trans.addError('minimum balance of 1000 required');
                    }
                    else{
                        //dont use variable like a,b,c
                        BankAccount__c b=idToBankMap.get(trans.BankAccount__c);
                        b.TotalAmount__c = newTotalAmount;
                        accountToUpdate.add(b); 
                        
                    }
                }
            }
            else if(trans.Type__c=='Credit'){
                if(idToBankMap.containsKey(trans.BankAccount__c)){
                    String dateStr = Date.today().format();
                    trans.Name= 'Cr-'+dateStr ;
                    BankAccount__c b=idToBankMap.get(trans.BankAccount__c);
                    System.debug('bankAccount' + b);
                    b.TotalAmount__c =b.TotalAmount__c+ trans.Amount__c;
                    accountToUpdate.add(b);                     
                }
            }         
            
            if(!accountToUpdate.isEmpty()){
                update accountToUpdate; 
            }
        }
    }
}
//remarks - code will make error in bulk 
//