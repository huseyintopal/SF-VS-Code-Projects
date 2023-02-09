@isTest
public class LeadUpdateTest {
    
    @isTest
    static void testLeadUpdates() {
        // Create a lead to test the update
        Lead testLead = new Lead(LastName='Test Lead', Description='Test Description', Company='Test Company', Status = 'Open - not Contacted');
        insert testLead;
        String leadDescription = testLead.Description;
        // Call the leadUpdates method
        LeadUpdate.leadUpdates();
        // Verify that the lead was updated
        testLead = [SELECT Description FROM Lead WHERE Id = :testLead.Id];
        System.assertNotEquals(leadDescription,testLead.Description);
    }
}