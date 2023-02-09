public class Greeting {
string firstName='Smith';
    public String fullName(){
        String lastName='Albert';
        String fName=firstName+ ' ' + lastName;
        return fName;
    }
    public string newGreeting(){
        String newGreeting='Hi';
        String newGreet=(newGreeting+' '+ fullName());
        return newGreet;
    }
    public void greetingAll(List<String> nameList){
    	for(string Hello:nameList){
        	System.debug('Hello '+Hello);
    }
    }
    public void greetingAllButLast(List<String> nameList){
        for(string noHi:nameList){
            System.debug('Hi '+noHi.split(' ',2)[0]);
        }
    }
    public void greetingToSmith(List<String> nameList){
        for (string salut : nameList){
            string salut1 = salut.split(' ', 2)[0];
            if(salut1=='Fatma'){
                System.debug('Bonjour '+salut1);
            }else{
                
            }
        }
    }
}