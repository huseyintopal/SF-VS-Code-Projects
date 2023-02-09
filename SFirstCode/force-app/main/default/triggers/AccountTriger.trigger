trigger AccountTriger on Account (before insert) {
    
    //trigger new
    for(Account a:trigger.new){
        if(trigger.isInsert && trigger.isUpdate){
            a.type = 'Prospect';
            
        }
        if(trigger.isBefore && trigger.isUpdate){
            a.Description = 'This Account is updated by ' + UserInfo.getName();
        }
    }
    

}