package groovy.com.github.straider.dojo.groovy.idea

class HelloWorldTest extends GroovyTestCase {

    void setUp() {
        super.setUp()
    }

    void tearDown() {
    }

    void testDefaultGreeting() {
        HelloWorld instance = new HelloWorld()
        assert instance.greet() == 'Hello, World!'
    }

    void testGreetingSomeoneByName() {
        HelloWorld instance = new HelloWorld()
        assert instance.greet( 'José' ) == 'Hello, José!'
    }

}
