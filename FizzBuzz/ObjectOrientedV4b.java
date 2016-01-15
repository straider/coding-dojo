// Compile command: javac ObjectOrientedV4b.java
// Execute command: java ObjectOrientedV4b

class ChainOfReponsibility {

  private final StepChain fizz  ;
  private final StepChain buzz  ;
  private final StepChain dazz  ;
  private final StepChain number;

  public ChainOfReponsibility() {
    fizz   = new StepWord   ( 3, "Fizz" );
    buzz   = new StepWord   ( 5, "Buzz" );
    dazz   = new StepWord   ( 7, "Dazz" );
    number = new StepNumber ();

    fizz.setNext( buzz   );
    buzz.setNext( dazz   );
    dazz.setNext( number );
  }

  public String say( final Integer value ) {
    fizz.execute( value );
    return fizz.say();
  }

}

public class ObjectOrientedV4b {

  public static void main( final String[] arguments ) {
    final ChainOfReponsibility chain = new ChainOfReponsibility();

    for ( int i = 1; i <= 100; i++ ) {
      final String line = chain.say( i );

      System.out.println( line );
    }
  }

}