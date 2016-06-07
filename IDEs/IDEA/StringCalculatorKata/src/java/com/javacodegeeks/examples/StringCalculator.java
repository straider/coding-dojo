//https://examples.javacodegeeks.com/desktop-java/ide/intellij-idea-tutorial-beginners/

package com.javacodegeeks.examples;

import java.util.List;

public class StringCalculator {

    public int add( final String input ) {
        int output = 0;

        final List< String > numbers = new InputNormalizer().normalize( input );
        InputValidator.validate( numbers );
        for ( final String number : numbers ) {
            int value = Integer.parseInt( number );
            if ( value < 1000) {
                output += value;
            }
        }

        return output;
    }

}
