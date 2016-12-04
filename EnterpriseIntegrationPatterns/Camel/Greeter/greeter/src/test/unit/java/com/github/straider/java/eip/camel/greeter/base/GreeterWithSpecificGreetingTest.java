package com.github.straider.java.eip.camel.greeter.base;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.Parameterized;

import java.util.Arrays;

import static org.hamcrest.MatcherAssert.assertThat;
import static org.hamcrest.core.Is.is;

@RunWith( Parameterized.class )
public class GreeterWithSpecificGreetingTest {

    private Greeter greeter;

    private String name;
    private String message;
    private String greeting;

    public GreeterWithSpecificGreetingTest( final String greeting, final String name, final String message ) {
        this.name     = name;
        this.message  = message;
        this.greeting = greeting;
    }

    @Before
    public void setUp() {
        greeter = new Greeter();
    }

    @Test
    public void testGreeterCanGreetSomeoneInDifferentFormats() {
        greeter.setGreeting( greeting );
        assertThat( greeter.speak( name ), is( message ) );
    }
    @Parameterized.Parameters
    public static Iterable< Object[] > nameAndMessageWithFormat() {
        return Arrays.asList(
                new Object[][] {
                        { null       , null       , "Hello, World!"         },
                        { ""         , ""         , "Hello, World!"         },
                        { "Hi"       , "José"     , "Hi, José!"             },
                        { "Greetings", "earthling", "Greetings, earthling!" }
                }
        );
    }

}