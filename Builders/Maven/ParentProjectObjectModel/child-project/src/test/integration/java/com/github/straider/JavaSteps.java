package com.github.straider;

import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;

public class JavaSteps {

    private Greeter greeter;
    private String  name;
    private String  message;

    @Given( "^a Greeter in Java$" )
    public void createGreeter() {
        greeter = new Greeter();
    }

    @When( "^it says something in Java$" )
    public void saysHelloWorld() {
        message = greeter.say();
    }

    @When( "^it greets (.+) in Java$" )
    public void greetsSomeone( final String someone ) {
        name    = someone;
        message = greeter.greet( someone );
    }

    @Then( "^the message is \"(.+)\" in Java$" )
    public void messageIs( final String greeting ) {
        assert greeting.equals( message );
    }

}
