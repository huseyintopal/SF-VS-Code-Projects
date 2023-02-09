public class MathC {
    public static integer KareAlan(Integer a){
        return a*a;
    }
    public static void Denklem(Integer x){
        Integer y= 2*x+5;
        system.debug('sonuc: '+ y);
    }
    public static integer MinBul(integer b, integer k, integer d){
        if(b<k && b<d){
            return b;
        }else if(k<b && k<d){
            return k;
        }else{
            return d;
        }
        
    }

}