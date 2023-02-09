public class newAccount10 {
    
    public static void updateAccount() {
        for(Account updateAccount : [Select Id, Name From Account Where Name='Phoenix']){
            updateAccount.Website ='www.mynewwebsite.com';
            updateAccount.Description='This is my updated account';
            updateAccount.Industry = 'Consulting';
            update updateAccount;
            //System.debug(updateAccount);
            
        }
       
    }

}