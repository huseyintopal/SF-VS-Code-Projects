@isTest
public class AccountHandlerTest {   
    
    @isTest
    public static void addStudenttoCohort_TEST1(){  // POSTIVE BEHAVIOR , SINGLE ACCOUNT, MULTI CONTACT
        // Preapare Data
        
        List<Contact> multiContact = New List<Contact>();
        
        for(Integer num=1;num<=200;num++){
            Contact singleContact= New Contact();
            singleContact.FirstName='TEST ' + num;
            singleContact.LastName='STUDENT '+num;
            
            multiContact.add(singleContact);            
        }
        
        Boolean result = AccountHandler.addStudenttoCohort('TEST COHORT',multiContact);
        
        
        // Test and Evaluate
         
        List<Contact> actual = [SELECT Id, Name, accountid, Account.Name FROM Contact];
        
        Account singleAcc = [SELECT id, Name FROM Account LIMIT 1];
        
        System.assertEquals(true, result);
        
        System.assertEquals(200, actual.size());  
        
        System.assertNotEquals(null, actual.get(0).accountid);  // TEST 1 STUDENT 1  
          
        System.assertEquals(singleAcc.id, actual.get(0).accountid); 
        
        System.assertEquals('TEST COHORT', singleAcc.Name);
        
        
    }
    
    
    
    @isTest
    public static void addStudenttoCohort_TEST2(){  // NEGATIVE BEHAVIOUR
        
           // Preapare Data
        
        List<Contact> multiContact = New List<Contact>();
        
        for(Integer num=1;num<=200;num++){
            Contact singleContact= New Contact();
            singleContact.FirstName='TEST ' + num;
            // singleContact.LastName='STUDENT '+num;
            
            multiContact.add(singleContact);            
        }
        
        Boolean result=AccountHandler.addStudenttoCohort('TEST COHORT',multiContact);
        
        
        // Test and Evaluate
         
        List<Contact> actual = [SELECT Id, Name, accountid, Account.Name FROM Contact];
        
        Account singleAcc = [SELECT id, Name FROM Account LIMIT 1];
        
        System.debug(singleAcc);
        System.debug(actual);
        
        System.assertEquals(false, result);
        System.assertEquals('TEST COHORT', singleAcc.name);
        
        System.assertEquals(0, actual.size());
        
    }
    
    
    
    @isTest
    public static void createtest1(){   // BULK TEST
        List<Account> multiAcc = New List<Account>();
        
        for(Integer x=1;x<=200;x++){
            
            Account singleAcc = New Account();
            
            singleAcc.Name='TEST Acc '+ x;
            multiAcc.add(singleAcc);
            
        }
        AccountHandler.createUpperCase(multiAcc);
        
        List<Account> testAcc = [SELECT id, Name FROM Account];
        
        
        System.assertEquals(200, testAcc.size());
        
    }
    
    
    @isTest
    public static void createtest2(){   // SINGLE TEST
        List<Account> multiAcc = New List<Account>();
            Account singleAcc = New Account();
            
            singleAcc.Name='TEST Acc 1';
            multiAcc.add(singleAcc);
            
      
        
        AccountHandler.createUpperCase(multiAcc);
        
        List<Account> testAcc = [SELECT id, Name FROM Account];
        
        
        System.assertEquals(1, testAcc.size());
        
    }
    
}