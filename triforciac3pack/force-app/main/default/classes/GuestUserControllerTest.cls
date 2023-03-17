@isTest
private class GuestUserControllerTest {
    @isTest
    static void createLeadTest() {
        Lead testLead = new Lead();
        testLead.FirstName = 'Test';
        testLead.LastName = 'Lead';
        testLead.Company = 'Test Company';
        String infoDate = '2023-03-01T20:26:00.000Z';
        
        Test.startTest();
        String leadId = GuestUserController.createLead(testLead, infoDate);
        Test.stopTest();
        
        Lead resultLead = [SELECT Id, FirstName, LastName, Company, Info_Session_Date_Time__c FROM Lead WHERE Id = :leadId];
        System.assertEquals('Test', resultLead.FirstName);
        System.assertEquals('Lead', resultLead.LastName);
        System.assertEquals('Test Company', resultLead.Company);
        System.assertEquals(Datetime.newInstance(2023, 3, 1, 20, 26, 0), resultLead.Info_Session_Date_Time__c);
    }
    
    @isTest
    static void retrieveCampaignTest() {
        Campaign testCampaign = new Campaign();
        testCampaign.Name = 'Test Campaign';
        insert testCampaign;
        
        Test.startTest();
        Campaign resultCampaign = GuestUserController.retrieveCampaign('Test');
        Test.stopTest();
        
        System.assertEquals(testCampaign.Id, resultCampaign.Id);
        System.assertEquals('Test Campaign', resultCampaign.Name);
    }
    
    @isTest
    static void createAdTest() {
        // create a Campaign record for the Ad__c lookup field
        Campaign campaign = new Campaign(Name = 'Test Campaign');
        insert campaign;
        
        // create an Ad__c record to insert
        CWHT5__Ad__c ad = new CWHT5__Ad__c(
            
            CWHT5__Campaign__c = campaign.Id,
            CWHT5__UTM_Campaign__c = 'Test UTM Campaign',
            CWHT5__UTM_Content__c = 'Test UTM Content',
            CWHT5__UTM_Referer__c = 'Test UTM Referer',
            CWHT5__UTM_Medium__c = 'Test UTM Medium',
            CWHT5__UTM_Source__c = 'Test UTM Source',
            CWHT5__UTM_Term__c = 'Test UTM Term'
        );
        
        // insert the Ad__c record
        Test.startTest();
        String adId = CWHT5.GuestUserController.createAd(ad);
        Test.stopTest();
        
        // query the inserted Ad__c record to verify that it was inserted correctly
        CWHT5__Ad__c insertedAd = [SELECT Id, Name, CWHT5__Campaign__c, CWHT5__UTM_Campaign__c, CWHT5__UTM_Content__c, CWHT5__UTM_Referer__c, CWHT5__UTM_Medium__c, CWHT5__UTM_Source__c, CWHT5__UTM_Term__c FROM CWHT5__Ad__c WHERE Id = :adId];
        
        System.assertEquals(ad.CWHT5__Campaign__c, insertedAd.Campaign__c);
        System.assertEquals(ad.CWHT5__UTM_Campaign__c, insertedAd.UTM_Campaign__c);
        System.assertEquals(ad.CWHT5__UTM_Content__c, insertedAd.UTM_Content__c);
        System.assertEquals(ad.CWHT5__UTM_Referer__c, insertedAd.UTM_Referer__c);
        System.assertEquals(ad.CWHT5__UTM_Medium__c, insertedAd.UTM_Medium__c);
        System.assertEquals(ad.CWHT5__UTM_Source__c, insertedAd.UTM_Source__c);
        System.assertEquals(ad.CWHT5__UTM_Term__c, insertedAd.UTM_Term__c);
    }
    
    
    @isTest
    private static void createCampaignMemberTest() {
        // Create a Campaign
        Campaign campaign = new Campaign(Name = 'Test Campaign');
        insert campaign;
        
        // Create a Contact
        Contact contact = new Contact(FirstName = 'John', LastName = 'Doe');
        insert contact;
        
        // Create a CampaignMember
        CampaignMember cm = new CampaignMember(CampaignId = campaign.Id, ContactId = contact.Id, Status = 'Sent');
        String cmId = GuestUserController.createCampaignMember(cm);
        
        // Verify that the CampaignMember was created successfully
        CampaignMember cm2 = [SELECT Id, CampaignId, ContactId, Status FROM CampaignMember WHERE Id = :cmId];
        System.assertEquals(campaign.Id, cm2.CampaignId);
        System.assertEquals(contact.Id, cm2.ContactId);
        System.assertEquals('Sent', cm2.Status);
    }
    @isTest
    static void retrieveCourseTest() {
        Course__c testCourse = new Course__c();
        testCourse.Name = 'Test Course';
        testCourse.Start__c = System.today().addDays(7);
        insert testCourse;
        
        Test.startTest();
        List<Course__c> resultCourses = GuestUserController.retrieveCourse();
        Test.stopTest();
        
        System.assertEquals(1, resultCourses.size());
        System.assertEquals('Test Course', resultCourses[0].Name);
        System.assertEquals(System.today().addDays(7), resultCourses[0].Start__c);
    }
@isTest
static void testCreateLeadNegative() {
    Lead lead = new Lead(
        FirstName = 'Test',
        LastName = '', // empty Last Name field
        Company = 'Test Company',
        Email = 'test@test.com',
        Phone = '555-555-5555'
    );
    String infoDate = '2023-03-01T20:26:00.000Z';
    
    Test.startTest();
    AuraHandledException auraException = null;
    try {
        GuestUserController.createLead(lead, infoDate);
    } catch (AuraHandledException e) {
        auraException = e;
    }
    Test.stopTest();
    
    System.assertNotEquals(null, auraException);
    System.assertEquals('Script-thrown exception', auraException.getMessage());
}
          @isTest
    static void testCreateCampaignMemberWithEmptyRequiredFields() {
        // Create a new CampaignMember object with empty required fields
        CampaignMember cm = new CampaignMember();
        // Verify that an exception is thrown when trying to insert the CampaignMember object
        Test.startTest();
        String campmemberId ;
        String errmsg;
        try{
            campmemberId = GuestUserController.createCampaignMember(cm);
        } catch(Exception e){
            System.debug('Error : '+ e.getMessage());
            errmsg=e.getMessage();
        } 
       
        Test.stopTest();
        
        
        Assert.areEqual(null, campmemberId);
        Assert.areEqual('Script-thrown exception', errmsg);
        
    }
    
    
}