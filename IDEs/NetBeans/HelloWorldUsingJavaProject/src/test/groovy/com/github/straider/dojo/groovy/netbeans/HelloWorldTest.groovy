package com.github.straider.dojo.groovy.netbeans

import org.junit.After
import org.junit.AfterClass
import org.junit.Before
import org.junit.BeforeClass
import org.junit.Test

import groovy.util.GroovyTestCase

class HelloWorldTest extends GroovyTestCase {

    public HelloWorldTest() {
    }

    @BeforeClass
    public static void setUpClass() {
    }

    @AfterClass
    public static void tearDownClass() {
    }

    @Before
    public void setUp() {
    }

    @After
    public void tearDown() {
    }
    
    void testDefaultGreeting() {
        HelloWorld instance = new HelloWorld()
        assert instance.greet() == 'Hello, World!'
    }

}
