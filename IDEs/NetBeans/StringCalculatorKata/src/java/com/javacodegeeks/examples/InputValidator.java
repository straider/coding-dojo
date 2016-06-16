//https://examples.javacodegeeks.com/desktop-java/ide/intellij-idea-tutorial-beginners/

package com.javacodegeeks.examples;

import java.util.List;

class InputValidator {

    static void validate( final List< String > numbers ) {
        final StringBuilder negativeNumbers = new StringBuilder();
        for ( final String number : numbers ) {
            int value = Integer.parseInt( number );
            if ( value < 0 ) {
                if ( negativeNumbers.length() > 0 ) {
                    negativeNumbers.append(",");
                }
                negativeNumbers.append( value );
            }
        }

        if ( negativeNumbers.length() > 0 ) {
            throw new RuntimeException( String.format( "[%s] negative numbers not allowed.", negativeNumbers.toString() ) );
        }
    }

}
