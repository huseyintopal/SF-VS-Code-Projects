public class handsOn {
    public void accAdd(){
        List<Account> newAccs = new List<Account>();
        Account acc1 = new Account(Name='Test 1');
        Account acc2 = new Account(Name='Test 2');
        Account acc3 = new Account(Name='Test 3');
        newAccs.add(acc1);
        newAccs.add(acc2);
        newAccs.add(acc3);
        insert newAccs;
    }
    public void AccGuncelle(){
        List<Account> accs=[Select Name from Account where Name like '%Test%'];
        List<Account> updAcc = new List<Account>();
        for(Account x:accs){
            x.Name='Harry';
            updAcc.add(x);
        }
        update updAcc;
    }

}