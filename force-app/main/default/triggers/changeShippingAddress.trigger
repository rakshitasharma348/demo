trigger changeShippingAddress on Account (before insert) {
    if(Trigger.isInsert && trigger.isBefore){
        handleShippingAddressHandler.handleInsert(trigger.new);
    }

}