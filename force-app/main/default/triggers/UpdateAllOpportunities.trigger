trigger UpdateAllOpportunities on Account (after update) {
    if(trigger.isAfter && trigger.isUpdate){
        UpdateAllOpportunitiesHandler.handleUpdate(trigger.new);
    }

}