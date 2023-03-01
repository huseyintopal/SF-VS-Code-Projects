public with sharing class GuestUserController {
    public GuestUserController() {

    }
    @AuraEnabled(cachable=true)
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