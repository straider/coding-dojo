//https://examples.javacodegeeks.com/desktop-java/ide/intellij-idea-tutorial-beginners/

package com.javacodegeeks.examples;

import java.util.Arrays;
import java.util.List;

class InputNormalizer {

    List< String > normalize( final String input ) {
        String result = input;

        String delimiters = "\n|,";
        if ( input.contains( "//" ) ) {
            delimiters = getDelimiters( result, delimiters );
            result     = stripDelimiters( result );
        }

        return Arrays.asList( result.split( delimiters ) );
    }

    private String getDelimiters( final String input, final String defaultDelimiters ) {
        final StringBuilder delimiters = new StringBuilder( defaultDelimiters );

        String numbers = input;
        while ( numbers.indexOf( "[" ) >= 0 ) {
            delimiters.append( "|" );
            final String delimiter = numbers.substring( numbers.indexOf( "[" ) + 1, numbers.indexOf( "]" ) );
            for ( final char delimiterChar : delimiter.toCharArray() ) {
                delimiters.append( "\\" ).append( delimiterChar );
            }
            numbers = numbers.substring( numbers.indexOf( "]" ) + 1 );
        }

        System.out.println(" delimiters.toString() = " + delimiters.toString());
        return delimiters.toString();
    }

    private String stripDelimiters( final String numbers ) {
        return numbers.substring( numbers.indexOf( "\n" ) + 1 );
    }

}
