/*@isTest
public class bmIndexTest {
    @isTest
    public static void calculateBMI_Test1(){
        Decimal result = bmIndex.calculateBMI(97, 2);
        System.assertEquals(24.25, result);
    }
    

}*/
@isTest
public class bmIndexTest {
    @isTest
    static void testCalculateBMI() {
        // Test the BMI calculation
        Decimal bmi = bmIndex.calculateBMI(97, -2);
        System.assertEquals(24.25, bmi);
    }
    @isTest
    static void testFullName() {
        // Test the full name
        String fullName = bmIndex.uppercaseBMI('John', 'Doe');
        System.assertEquals('JOHN DOE', fullName);
    }
    
}