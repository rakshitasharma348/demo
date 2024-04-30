public class sendEmailToAdminHandler {
    public static void handleInsert(List<Account> accountList){
        List<Messaging.SingleEmailMessage> mailsList = new List<Messaging.SingleEmailMessage>();
        User userObj = [SELECT Id,Profile.Name,Email from User WHERE Profile.Name='System Administrator'];
        for(Account accObj:accountList){
            if(userObj.Email != NULL){
                Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
                mail.setSenderDisplayName('Salesforce');
                mail.setUseSignature(false);
                mail.setBccSender(false);
				mail.setSaveAsActivity(false);
                mail.toAddresses = new String[]{userObj.Email};
                    mail.setSubject('New Account was Created.');
                String body = 'Dear System Administrator, <br/>';
				body += 'An account has been created and name is '+accObj.Name+'.';
                mail.setHtmlBody(body);
                mailsList.add(mail);
            }
        }
        if(mailsList.size()>0){
            Messaging.SendEmailResult[] results = Messaging.sendEmail(mailsList);
        }
    }

}