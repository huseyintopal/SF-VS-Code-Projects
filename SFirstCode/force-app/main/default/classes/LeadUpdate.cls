public class LeadUpdate {
    
    public static void leadUpdates(){
        
        List<Lead> multiLeads = New List<Lead>();
        
        List<Lead> leadList = [Select id, Name, Description From Lead];
        for(Lead singleLead : leadList ){
            singleLead.Description = '1111111 leads description updated to apply bulk apex test';
            multiLeads.add(singleLead);
        }
        update multiLeads;
        system.debug(multiLeads);
    }
   

}