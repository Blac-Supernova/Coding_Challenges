@isTest
private class CalculatorTest {
    
    //Test for add method
    @isTest
    private static void addTest(){
        Integer result = Calculator.add(2,3);
        System.assertEquals(5, result, 'Adding 2 and 3 should be 5');
    }
    //Test for multiplication method
    @isTest
    private static void multiplyTest(){
        Integer result = Calculator.multiply(2,3);
        System.assertEquals(6, result, 'Adding 2 and 3 should be 6');
    }
    
   //Test for exception to be thrown when dividing by zero
        @isTest
    private static void divideByZeroTest(){
         try {
            Calculator.divide(10, 0);
        }  catch (Exception e) {System.assertEquals('You cannot divide by zero', e.getMessage(), 'Exception messages do not match');
           }

    }
    //Test for division method between two integers evenly
        @isTest
    private static void divideTest(){
        Integer result = Calculator.divide(20,5);
        System.assertEquals(4, result, 'the quotient of 20 divided by 5 should be 4');
    }
        //Test for division method between two integers evenly
        @isTest
    private static void divideZeroDividendTest(){
        Integer result = Calculator.divide(0,5);
        System.assertEquals(0, result, 'the quotient of 0 divided by 5 should be 0');
    }
            //Test for division method between two integers evenly
        @isTest
    private static void moduloTest(){
        Integer result = Calculator.mod(19,6);
        System.assertEquals(0, result, 'the remainder of 19 divided by 6 should be 1');
    }

}