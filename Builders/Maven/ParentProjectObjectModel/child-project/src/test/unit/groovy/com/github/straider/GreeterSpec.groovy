package com.github.straider

import spock.lang.Specification
import spock.lang.Unroll

class GreeterSpec extends Specification  {

    Greeter greeter

    void setup() {
        greeter = new Greeter()
    }

    void cleanup() {
    }

    def "Greeter can say 'Hello, World!'"() {
        given:
        String message = 'Hello, World!'

        expect:
        message == greeter.say()
    }

    @Unroll
    def "Greeter can greet #name"() {
        expect:
        message == greeter.greet( name )

        where:
        name          | message
        'José'        | 'Hello, José!'
        'José Carlos' | 'Hello, José Carlos!'
    }

}
