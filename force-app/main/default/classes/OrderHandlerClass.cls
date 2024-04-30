public class OrderHandlerClass {
    public static void handle(List<Order> newOrders){
        List<Order> ordersToInsert= new List<Order>();
        Set<Id> accountIds= new Set<Id>();
        Map<Id,List<Order>> accountToOrderMap = new Map<Id,List<Order>>();
        for(Order newOrder:newOrders ){
            accountIds.add(newOrder.AccountId);  
        }
        List<Order> OrderList=[SELECT Id,  EffectiveDate FROM Order Where AccountId IN:accountIds ];
        for(Order o:OrderList ){
            accountToOrderMap.put(o.AccountId, OrderList);
            
        }
        for (Order newOrder : newOrders) {
            
            if (accountToOrderMap.containsKey(newOrder.accountId)) {
                List<Order> existingOrders = accountToOrderMap.get(newOrder.accountId);
                
                for (Order existingOrder : existingOrders) {
                    if (existingOrder.EffectiveDate != null && existingOrder.EffectiveDate == newOrder.EffectiveDate) {
                        newOrder.addError('Duplicate Order, Order exists with the same start date.');
                        break; 
                    }
                    
                }
            }
        }
    }
}