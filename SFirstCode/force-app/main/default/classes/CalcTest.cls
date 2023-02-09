@isTest
public class CalcTest {
    @isTest
    public static void sumTest(){
        Integer actual = Calc.sum(10,10);
        System.assertEquals(20, actual);
    }
    
    @isTest
    public static void subTest(){
        Integer actual = Calc.sub(10,10);
        System.assertEquals(0, actual);
    }
    
    @isTest
    public static void mulTest(){
        Integer actual = Calc.mul(10,10);
        System.assertEquals(100, actual);
    }
    
    @isTest
    public static void divTest(){
        Integer actual = Calc.div(10,10);
        System.assertEquals(1, actual);
    }




}