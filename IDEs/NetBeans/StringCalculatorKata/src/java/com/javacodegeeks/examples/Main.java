//https://examples.javacodegeeks.com/desktop-java/ide/intellij-idea-tutorial-beginners/

package com.javacodegeeks.examples;

public class Main {

    public static void main( final String[] arguments ) {
        final StringCalculator calculator = new StringCalculator();

        final String numbers = "//[***][%]\n1***2%3";
        final Integer result = calculator.add( numbers );
        System.out.println( "output = " + result );
    }
    
}
