public class TestDataFactory {
    public static void createAcc(Integer num){
        List<Account> listAcc = new List<Account>();
        for(Integer i=0;i<=num;i++){
            Account acc=new Account();
            acc.Name='TestAcc'+i;
            listAcc.add(acc);
        }
        insert listAcc;
    }

}