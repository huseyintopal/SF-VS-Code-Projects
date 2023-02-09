public class AccountHandler {
    
    public static Boolean addStudenttoCohort(String CohortName,List<Contact> multiContact ){
        
        Account singleAccount = New Account();
        
        singleAccount.Name=CohortName; 
        
        insert singleAccount;
        
        
        for(Contact loopcontact:multiContact){
            loopcontact.AccountId=singleAccount.id;
            
            if(loopcontact.LastName==null || loopcontact.LastName==''){ 
               // throw error. 
               return false;    
            }
            
        }
        
        upsert multiContact;
      
        
        return true;        
    }
      
    
    
    public static void createUpperCase(List<Account> multiAcc){ // bulkification
        
        for(Account acc:multiAcc){
            acc.name=acc.name.toUpperCase();
        }
        
        insert multiAcc;  
        
    }
    
    
    
}