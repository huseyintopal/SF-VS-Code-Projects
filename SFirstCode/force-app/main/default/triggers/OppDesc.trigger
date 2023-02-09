trigger OppDesc on Opportunity (before insert, before update) {
     for (Opportunity opp : Trigger.new) {
        if (Trigger.isInsert) {
            opp.Description = 'This opportunity was created by ' + UserInfo.getName() + ' (' + UserInfo.getUserName() + ')';
        } else if (Trigger.isUpdate) {
            opp.Description = 'This opportunity was updated by ' + UserInfo.getName() + ' (' + UserInfo.getUserName() + ')';
        }
    }

}