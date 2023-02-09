public class PerimeterCalculator {
    public static Integer perimeter;
    public static Integer perCalc(Integer a, Integer b, Integer c){
        perimeter = a + b + c;
        System.debug('Perimeter of Triangle ' + perimeter);
        return perimeter;
    }
    public static Integer perCalc(Integer a, Integer b, Integer c, Integer d){
        perimeter = a + b + c + d;
        System.debug('Perimeter of Rectangle ' + perimeter);
        return perimeter;
    }

}