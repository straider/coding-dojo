// Compile command: javac ChainOfReponsibility.java

public class ChainOfReponsibility {

  private final StepChain fizz  ;
  private final StepChain buzz  ;
  private final StepChain number;

  public ChainOfReponsibility() {
    fizz   = new StepFizz   ();
    buzz   = new StepBuzz   ();
    number = new StepNumber ();

    fizz.setNext( buzz   );
    buzz.setNext( number );
  }

  public String say( final Integer value ) {
    fizz.execute( value );
    return fizz.say();
  }

}