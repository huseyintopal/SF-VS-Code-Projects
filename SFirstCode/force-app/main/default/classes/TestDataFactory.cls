/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 02-09-2023
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public class TestDataFactory {
    public static void createAcc(Integer num){
        List<Account> listAcc = new List<Account>();
        for(Integer i=0;i<=num;i++){
            Account acc=new Account();
            acc.Name='TestAcc'+i;
            listAcc.add(acc);
            //Deneme
        }
        insert listAcc;
    }

}