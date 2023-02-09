@isTest
public class AccountHandsOnTest {
    @isTest
    public static void Test1(){
        TestDataFactory.createAcc(1);
        
        Account a = [SELECT Type FROM Account];
        System.assertEquals('Prospect', a.Type);
    }
    @isTest
    public static void Test2(){
        Test.startTest();  
        TestDataFactory.createAcc(10);
        Test.stopTest();
        
        List<Account> accList=[Select Type From Account];
        for(Account a:accList){
            System.assertEquals('Prospect', a.Type);
        }
    }

}