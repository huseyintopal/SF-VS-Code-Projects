trigger PreventCampaignUpdate on Campaign (before insert) {
    for (Campaign camp : Trigger.new) {
        Campaign oldCamp = Trigger.oldMap.get(camp.Id);
        if (camp.StartDate != oldCamp.StartDate) {
            camp.StartDate.addError('You cannot change campaign start date, please contact your Admin');
        }
    }

}