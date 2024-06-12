public class Calculator {
    public static Integer add(Integer x, Integer y){
        return x + y;
    }
    
    public static integer Multiply(Integer x, Integer y){
        Integer result = 0;
        for (integer i = 0; i < y; i++){
            result = add(result, x);
        }
        return result;
    }
    
    public static Integer Divide(integer dividend, integer divisor){
        
        if (divisor == 0){
            throw new IllegalArgumentException('You cannot divide by zero');
        }
        
        Integer quotient = 0;
        Integer remainder = dividend;
        
        while(remainder >= divisor){
            remainder -= divisor;
            quotient = add(quotient,1);
        }
        
        
        return quotient;
    }
        public static Integer Mod(integer dividend, integer divisor){
        
        if (divisor == 0){
            throw new IllegalArgumentException('You cannot divide by zero');
        }
        
        Integer quotient = 0;
        Integer remainder = dividend;
        
        while(remainder >= divisor){
            remainder -= divisor;
            quotient = add(quotient,1);
        }
        
        
        return remainder;
    }
    
}