Feature: Greeter tested with Groovy

  As A person
  I Want to be able to say hello and greet someone
  So That I'm considered polite

  Scenario: Say "Hello, World!"
    Given a Java Greeter
    When says something
    Then message is "Hello, World!"

  Scenario Outline: Say "Hello, World!"
    Given a Java Greeter
    When greets <someone>
    Then message is "Hello, <someone>!"

    Examples:
      | someone     |
      | José        |
      | José Carlos |
