package com.github.straider.java.eip.camel.greeter.base;

import org.junit.Before;
import org.junit.Test;

import static org.junit.Assert.assertEquals;

public class GreeterWithDefaultsTest {

    private Greeter greeter;

    @Before
    public void setUp() {
        greeter = new Greeter();
    }

    @Test
    public void testGreeterCanSayHelloWorld() {
        assertEquals( "Hello, World!", greeter.speak() );
    }

    @Test
    public void testGreeterCanSayHelloToSomeone() {
        assertEquals( "Hello, José!", greeter.speak( "José" ) );
    }

}