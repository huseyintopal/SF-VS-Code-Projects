public with sharing class GuestUserController {
    public GuestUserController() {

    }

    @AuraEnabled(cacheable=true)
    public static Campaign retrieveCampaign(String searchCampaign) {
        String search = '%' + searchCampaign + '%';
        Campaign singleCampaign = new Campaign();
        try {
            singleCampaign=[SELECT Id, Name FROM Campaign WHERE Name =: search LIMIT 1];
            
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
        return singleCampaign;
    }


    @AuraEnabled
    public static string createAd(Ad__c singleAd){
        try {
            insert singleAd;
            
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
        return singleAd.id;
    }


    @AuraEnabled
    public static string createCampaignMember(CampaignMember cmember){
        try {
            insert cmember;
            
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
        return cmember.id;
    }



    @AuraEnabled(cacheable=true)
    public static List<Course__c> retrieveCourse(){
        List<Course__c> multiCourse = new List<Course__c>();

        try {
            multiCourse=[SELECT Id, Name, Cohort__c, End__c, Interview__c, Module__c, Start__c FROM Course__c];
            
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
        return multiCourse;
    }
}