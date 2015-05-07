// Compile command: javac ChainOfReponsibility.java

public class ChainOfReponsibility {

  private final StepChain fizz  ;
  private final StepChain buzz  ;
  private final StepChain number;

  public ChainOfReponsibility() {
    fizz   = new StepWord   ( 3, "Fizz" );
    buzz   = new StepWord   ( 5, "Buzz" );
    number = new StepNumber ();

    fizz.setNext( buzz   );
    buzz.setNext( number );
  }

  public String say( final Integer value ) {
    fizz.execute( value );
    return fizz.say();
  }

}