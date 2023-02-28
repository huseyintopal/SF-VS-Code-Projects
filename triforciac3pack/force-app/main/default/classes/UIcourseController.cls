public with sharing class UIcourseController {
    public UIcourseController() {
    }
    @AuraEnabled(cacheable=true)
    public static List<Course__c> retrieve(){
        List<Course__c> multiCourse = new List<Course__c>();
        try {
            
            multiCourse=[SELECT Id, Name, Cohort__c, End__c, Interview__c, Module__c, Start__c FROM Course__c];
            
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
        return multiCourse;
    }
}

// SELECT Id, Name, Cohort__c, End__c, Interview__c, Module__c, Start__c FROM Course__c