trigger AccountWithContact on Account (before delete) {
    /*trigger AccountContact on Account (before delete) {
        List<Contact> relatedContacts = [SELECT AccountId FROM Contact WHERE AccountId IN :trigger.oldMap.keyset()];
    for(contact cont:relatedContacts){
        system.debug(cont);
            trigger.oldMap.get(cont.accountId).addError('You can\'t delete an Account which has a related Contact');
    }
}*/
        List<contact> Contacts = [select accountid from contact ];
        list<id> accIds=new list<id>();
          for(contact con: Contacts)
                 accIds.add(con.accountid); //contactı olan accountların listesi mevcut.
        	for(account acc:trigger.old) //mevcut accountların listesi.
            if(accIds.contains(acc.id))
                acc.adderror('You can\'t delete an Account which has a related Contact');
}