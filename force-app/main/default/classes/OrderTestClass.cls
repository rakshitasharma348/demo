@isTest
public class OrderTestClass {
    @isTest
    static void testHandleMethod() {
        Account test = new Account(Name='Test');
        insert test;
        Order O1= new Order(AccountId=test.Id,EffectiveDate=Date.today());
        Order O2= new Order(AccountId=test.Id,EffectiveDate=Date.newInstance(2024,1,1));
        Order O3= new Order(AccountId=test.Id,EffectiveDate=Date.newInstance(2024,1,4));
        
        List<Order> orderList = new List<Order>{O1,O2,O3};
            System.assertEquals(0,[SELECT count() FROM Order WHERE AccountId =:test.Id ]);
        OrderHandlerClass.handle(orderList);
        
    }
    }