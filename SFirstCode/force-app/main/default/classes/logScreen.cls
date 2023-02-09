public class logScreen {
    public static final String CORRECT_USERNAME = 'john';
    public static final String CORRECT_PASSWORD = 'password';

    public static String login(String username, String password) {
        if(username == CORRECT_USERNAME && password == CORRECT_PASSWORD) {
            return 'You logged in successfully';
        } else if(username == CORRECT_USERNAME && password != CORRECT_PASSWORD) {
            return 'You entered a wrong password';
        } else if(username != CORRECT_USERNAME && password == CORRECT_PASSWORD) {
            return 'You entered a wrong username';
        } else {
            return 'Your both username and password are wrong';
        }
    }

}