@isTest
public class BodyMassIndex_Test {
    @isTest
    public static void calBMI_Test1 (){
        Decimal result = BodyMassIndex.calBMI(83, -1.85);
            System.assertEquals(24.2512783053323593864134404674945, result);
                   
    }
    
     @isTest
    public static void calBMI_Test2 (){
        Decimal result = BodyMassIndex.calBMI(83, 1.85);
            System.assertEquals(24.2512783053323593864, result ,'Method is not working');
                   
    }
    
     @isTest
    public static void calBMI_Test3 (){
        String result = BodyMassIndex.BMIUpperCase('Harry', 'Thomas');
            System.assertEquals('HARRY THOMAS', result);
                   
    }
    
    
    
    

}