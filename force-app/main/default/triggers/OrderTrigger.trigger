trigger OrderTrigger on Order (before insert) {
     OrderHandlerClass.handle(Trigger.new);

}