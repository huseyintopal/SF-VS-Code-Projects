@isTest
public class LogScreenTest {
     @isTest
    static void testSuccessfulLogin() {
        String username = logScreen.CORRECT_USERNAME;
        String password = logScreen.CORRECT_PASSWORD;
        String expectedResult = 'You logged in successfully';
        String actualResult = logScreen.login(username, password);
        System.assertEquals(expectedResult, actualResult);
    }

    @isTest
    static void testWrongUsername() {
        String username = 'jane';
        String password = logScreen.CORRECT_PASSWORD;
        String expectedResult = 'You entered a wrong username';
        String actualResult = logScreen.login(username, password);
        System.assertEquals(expectedResult, actualResult);
    }

    @isTest
    static void testWrongPassword() {
        String username = logScreen.CORRECT_USERNAME;
        String password = 'wrongpassword';
        String expectedResult = 'You entered a wrong password';
        String actualResult = logScreen.login(username, password);
        System.assertEquals(expectedResult, actualResult);
    }

    @isTest
    static void testWrongUsernameAndPassword() {
        String username = 'jane';
        String password = 'wrongpassword';
        String expectedResult = 'Your both username and password are wrong';
        String actualResult = logScreen.login(username, password);
        System.assertEquals(expectedResult, actualResult);
    }

}