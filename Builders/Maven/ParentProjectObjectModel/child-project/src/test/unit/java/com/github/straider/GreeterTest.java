package com.github.straider;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.Parameterized;

import java.util.Arrays;

import static org.hamcrest.MatcherAssert.assertThat;
import static org.hamcrest.core.Is.is;
import static org.junit.Assert.assertEquals;

@RunWith( Parameterized.class )
public class GreeterTest {

    private Greeter greeter;

    private String name;
    private String message;

    public GreeterTest( final String name, final String message ) {
        this.name    = name;
        this.message = message;
    }

    @Before
    public void setUp() {
        greeter = new Greeter();
    }

    @Test
    public void testGreeterCanSayHelloWorld() {
        assertEquals( "Hello, World!", greeter.say() );
    }

    @Test
    public void testGreeterCanGreetSomeone() {
        assertEquals( "Hello, José!", greeter.greet( "José" ) );

        assertThat( greeter.greet(name), is( message ));
    }
    @Parameterized.Parameters
    public static Iterable< Object[] > data() {
        return Arrays.asList(
                new Object[][] {
                        { "José"       , "Hello, José!"        },
                        { "José Carlos", "Hello, José Carlos!" }
                }
        );
    }

}