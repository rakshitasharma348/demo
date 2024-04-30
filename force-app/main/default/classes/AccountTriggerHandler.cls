public class AccountTriggerHandler {
    public static void updateDesc(List<Account> accList){
        for( Account acc:accList ){
             acc.Description= ' Account is created';
        }
    }
    public static void populateRating( List<Account> accList){
        for(Account acc: accList){
            if( acc.Industry != null && acc.Industry == 'media'){
                acc.Rating='Hot';
            }
        }
    }

}