package com.github.straider

import static cucumber.api.groovy.EN.Given
import static cucumber.api.groovy.EN.When
import static cucumber.api.groovy.EN.Then

Greeter greeter
String  name
String  message

Given(~/^a Java Greeter$/) { ->
    greeter = new Greeter()
}

When(~/^says something$/) { ->
    message = greeter.say()
}

When(~/^greets (.+)$/) { String someone ->
    name    = someone
    message = greeter.greet( someone )
}

Then(~/^message is "(.+)"$/) { String greeting ->
    assert greeting == message
}
