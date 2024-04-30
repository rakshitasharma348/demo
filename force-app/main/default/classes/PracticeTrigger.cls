public class PracticeTrigger {
    public static void practicemMethod(){
        Map<Integer,String> practiceMap= new Map<Integer,String>();
        practiceMap.put(10, 'Rakshita1');
        practiceMap.put(20, 'Rakshita2');
        practiceMap.put(30, 'Rakshita3');
        for(Integer i=0; i<practiceMap.values().size(); i++){
            System.debug(practiceMap.values().get(i));
            System.debug(practiceMap.keyset());
    }

}

}