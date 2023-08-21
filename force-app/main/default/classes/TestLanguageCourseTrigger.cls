public with sharing class TestLanguageCourseTrigger {
    public TestLanguageCourseTrigger() {
        Test.startTest();
        Language_Course_Instructor__c lci = new Language_Course_Instructor__c(Name = 'Bob');
        insert(lci);
        Id lciId = lci.Id;
        Language_Course__c lc = new Language_Course__c(Name='testA', Course_Instructor__c = lciId);
        Test.stopTest();
    }
}