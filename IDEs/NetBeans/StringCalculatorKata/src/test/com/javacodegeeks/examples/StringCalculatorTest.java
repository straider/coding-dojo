//https://examples.javacodegeeks.com/desktop-java/ide/intellij-idea-tutorial-beginners/

package com.javacodegeeks.examples;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;

import static org.junit.Assert.assertEquals;

public class StringCalculatorTest {

    private StringCalculator calculator;

    public StringCalculatorTest() {
    }

    @BeforeClass
    public static void setUpClass() {
    }

    @AfterClass
    public static void tearDownClass() {
    }

    @Before
    public void setUp() {
        calculator = new StringCalculator();
    }

    @After
    public void tearDown() {
    }

    @Test
    public void testDefaultDelimiters() {
        final String input = "1\n2,3";
        assertEquals( 6, calculator.add( input ) );
    }

    @Test
    public void testMultiDelimiters() {
        final String input = "//[***][%]\n1***2%3";
        assertEquals( 6, calculator.add( input ) );
    }

    @Test
    public void testNumbersMoreThan1000() {
        final String input = "//[***][%]\n1***2%3,2000";
        assertEquals( 6, calculator.add( input ) );
    }

}
