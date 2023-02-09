@isTest
public class HelloApexTest {
    @isTest
    public static void helloTest1(){
        String actual=HelloApex.msg('test');
        System.assertEquals('TEST Clarusway Salesforce Cohort 3', actual);        
    }
    
    @isTest
    public static void helloTest2(){
        String actual=HelloApex.msg('test');
        
        System.assertEquals('test', actual);
    }

}