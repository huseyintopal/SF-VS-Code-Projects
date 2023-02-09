trigger PreventDublicateLead on Lead (before insert) {
    
    // Query for existing Leads with the same first and last name
    List<Lead> existingLeads = [SELECT Id FROM Lead WHERE FirstName = :Trigger.new[0].FirstName AND LastName = :Trigger.new[0].LastName];

    // If any existing Leads are found, add an error message to the new Lead
    if (!existingLeads.isEmpty()) {
        Trigger.new[0].addError('A Lead with this first and last name already exists.');
    }

}