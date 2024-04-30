global class Session {
    global static String getSessionIdFromVFPage(PageReference SessionId){

        String content = SessionId.getContent().toString();

        Integer s = content.indexOf('Start_Of_Session_Id') + 'Start_Of_Session_Id'.length(),

                e = content.indexOf('End_Of_Session_Id');

        return content.substring(s, e);

    }

}