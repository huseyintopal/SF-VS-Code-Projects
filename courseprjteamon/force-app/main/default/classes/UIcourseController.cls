public with sharing class UIcourseController {
    public UIcourseController() {

    }
    
    @AuraEnabled(cacheable=true)
    public static list<Course__c> retrieve(){
        List<Course__c> multiCourse = new List<Course__c>();
        try {
            multiCourse=[SELECT Id, Name, Cohort__c, End__c, Interview__c, Module__c, Start__c FROM Course__c
            WHERE Start__c>TODAY];
            
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
        
        return multiCourse;
    }
    
}