trigger OpportunityTrigger on Opportunity (before update) {
    
    if(trigger.isBefore && trigger.isUpdate){
        OpportunityHandler.checkstage(Trigger.New, Trigger.old, Trigger.OldMap, Trigger.NewMap );
        
    }
    
    

}