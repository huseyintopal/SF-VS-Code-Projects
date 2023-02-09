public class LoginScreen {
    public static void logScreen(String Username, Integer password){
        String loginMessage = '';
        
        if (Username == 'Harry' && password == 1234){
            loginMessage = 'You logged in successfully';
        }
        else if (Username == 'Harry' && password != 1234){
            loginMessage = 'You entered a wrong password';
        }
        else if (Username != 'Harry' && password == 1234){
            loginMessage = 'You entered a wrong username';
        }
        else{
            loginMessage = 'Your both username and password are wrong';
            
        }
        string x = loginMessage;
        system.debug(x);
        //return loginMessage;
        
        
    }

}