Feature: Greeter tested with Java

  As A person
  I Want to be able to say hello and greet someone
  So That I'm considered polite


  Scenario: Say "Hello, World!"
    Given a Greeter in Java
    When it says something in Java
    Then the message is "Hello, World!" in Java

  Scenario Outline: Say "Hello, World!"
    Given a Greeter in Java
    When it greets <someone> in Java
    Then the message is "Hello, <someone>!" in Java

    Examples:
      | someone     |
      | José        |
      | José Carlos |
