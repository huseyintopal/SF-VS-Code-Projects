@isTest
public class Convertor_Test {
    @isTest
    public static void kmToMile_Test1(){
        Decimal sonuc = Converter.kmToMile(10);
        
        System.assertEquals(6.20, sonuc);
    }
    @isTest
    public static void mileToKm_Test2(){
        Decimal sonuc = Converter.mileToKm(10);
        
        System.assertEquals(16, sonuc);
    }
    

}