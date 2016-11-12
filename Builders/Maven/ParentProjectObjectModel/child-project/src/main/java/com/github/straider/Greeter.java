package com.github.straider;

public class Greeter {

    public String say() {
        return "Hello, World!";
    }

    public String greet( final String name ) {
        return String.format( "Hello, %s!", name );
    }

}
