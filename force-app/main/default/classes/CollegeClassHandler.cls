public class CollegeClassHandler {
    public static void handleinsert( Map<Id, Class__c> newMap ){
        List<Class__c> updateClass=new List<Class__c>();
         Map<Id,college__c> updateCollege=new Map<Id,college__c >();
        for(Class__c cls:[SELECT Id,Max_Limit__c,Name,College__c,Is_Highest__c  ,College__r.Highest_Limit__c,College__r.Highest_Class__c FROM Class__c WHERE Id IN:newMap.keySet() ]){
                              if(cls.Max_Limit__c>cls.College__r.Highest_Limit__c){
                                  updateCollege.put( cls.College__c,new college__c(Id=cls.College__c,Highest_Limit__c=cls.Max_Limit__c,Highest_Class__c=cls.Id));
                                  updateClass.add(new Class__c(Id=cls.Id,Is_Highest__c=true));
                                  updateClass.add(new Class__c(Id=cls.College__r.Highest_Class__c,Is_Highest__c=false));
                              }
                          }
        update updateClass;
          update updateCollege.values();
    }}