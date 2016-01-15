// Compile command: javac ObjectOrientedV4a.java
// Execute command: java ObjectOrientedV4a

class ChainOfReponsibility {

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

public class ObjectOrientedV4a {

  public static void main( final String[] arguments ) {
    final ChainOfReponsibility chain = new ChainOfReponsibility();

    for ( int i = 1; i <= 100; i++ ) {
      final String line = chain.say( i );

      System.out.println( line );
    }
  }

}