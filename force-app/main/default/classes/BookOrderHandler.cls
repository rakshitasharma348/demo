public class BookOrderHandler { 
    public static void handleOrder(List<Book_Order__c> newOrderList , Map<Id, Book_Order__c> oldMap){
        
        Set<Id> bookOrderIds = new Set<Id>();
        Map<Id,Book_In_Warehouse__c> updateBookInWareHouse= new Map<Id,Book_In_Warehouse__c>();
        List<Book_Order__c> bookOrderToUpdate= new List<Book_Order__c>();
        
        Map<Id,List<Book_Order_Lines__c>>orderToLinesMap = new Map<Id, List<Book_Order_Lines__c>>();
        MAp<Id, list<Book_In_Warehouse__c>> warehouseToBookInWarehouseMap= new Map<id, List<Book_In_Warehouse__c>>();
        
        
        for(Book_In_Warehouse__c bookInWareHouse : [SELECT Id, Book__c,Quantity__c,Warehouse__c FROM Book_In_Warehouse__c]){
            if(warehouseToBookInWarehouseMap!=null && !warehouseToBookInWarehouseMap.ContainsKey(bookInWareHouse.Warehouse__c)){
                warehouseToBookInWarehouseMap.put(bookInWareHouse.Warehouse__c,new List<Book_In_Warehouse__c>());
            }
            warehouseToBookInWarehouseMap.get(bookInWareHouse.Warehouse__c).add(bookInWareHouse);
        }
        for(Book_Order__c order:newOrderList){
            if( order.Status__c=='Ordered'&& oldMap.ContainsKey(order.Id) && order.Status__c !=  oldMap.get(order.Id).Status__c ){               
                bookOrderIds.add(order.Id);    
            }
        }  
        List<Book_Order__c> bookOrderWithBookOrderLines=[ SELECT Id,Status__c,(Select Id, BookOrder__c, Book__c,Quantity__c FROM Books_Order_Lines__r) FROM Book_Order__c WHERE Id IN:bookOrderIds ];
        for(Book_Order__c  bOrder:bookOrderWithBookOrderLines){
            if(!orderToLinesMap.ContainsKey(bOrder.Id)){
                orderToLinesMap.put(bOrder.Id, new List<Book_Order_Lines__c>());
            }
            orderToLinesMap.get(bOrder.Id).addAll(bOrder.Books_Order_Lines__r);          
        }
        
        
        for(Id ids:orderToLinesMap.Keyset()){
            Boolean AvailableInwareHouse;
            for(id wid: warehouseToBookInWarehouseMap.KeySet()){
                AvailableInwareHouse=false;
                for(Book_Order_Lines__c orderLine:  orderToLinesMap.get(ids)){
                    
                    for(Book_In_Warehouse__c bc:warehouseToBookInWarehouseMap.get(wid)) {
                        if(bc.Book__c==orderLine.Book__c && bc.Quantity__c>=orderLine.Quantity__c){ 
                            AvailableInwareHouse=true; 
                            break;
                        }
                        else{
                            AvailableInwareHouse=false;
                        }
                    }
                    if(AvailableInwareHouse==false){
                        break;
                    }
                }
                if(AvailableInwareHouse==true){
                    bookOrderToUpdate.add(new Book_Order__c(Id=ids,Status__c='shipped'));
                    for(Book_Order_Lines__c orderLine:  orderToLinesMap.get(ids)){
                        
                        for(Book_In_Warehouse__c bc:warehouseToBookInWarehouseMap.get(wid)) {
                            if(bc.Book__c==orderLine.Book__c && bc.Quantity__c>=orderLine.Quantity__c){
                                
                                Decimal quantity=bc.Quantity__c - orderLine.Quantity__c;
                                bc.Quantity__c=quantity;
                                updateBookInWareHouse.put(bc.Id,new Book_In_Warehouse__c(Id=bc.Id,Quantity__c=quantity));
                            }                       
                        }
                        
                    }   
                    
                }
            }
            if(AvailableInwareHouse==false){
                bookOrderToUpdate.add(new Book_Order__c(Id=ids,Status__c='backOrdered'));
                
            }
            
        } 
        update bookOrderToUpdate; 
        update updateBookInWareHouse.values();
    }
}