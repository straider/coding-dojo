// Compile command: javac ObjectOrientedV4.java
// Execute command: java ObjectOrientedV4

public class ObjectOrientedV4 {

  public static void main( final String[] arguments ) {
    final ChainOfReponsibility chain = new ChainOfReponsibility();

    for ( int i = 1; i <= 100; i++ ) {
      final String line = chain.say( i );

      System.out.println( line );
    }
  }

}