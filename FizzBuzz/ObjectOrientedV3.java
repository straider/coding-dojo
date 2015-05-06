// Compile command: javac ObjectOrientedV3.java
// Execute command: java ObjectOrientedV3

public class ObjectOrientedV3 {

  public static void main( final String[] arguments ) {
    final NumberWord    decoder = new NumberWord();
    final BuzzDecorator buzz    = new BuzzDecorator( decoder );
    final FizzDecorator fizz    = new FizzDecorator( buzz    );
    
    for ( int i = 1; i <= 100; i++ ) {
      final String line = fizz.say( i );

      System.out.println( line );
    }
  }

}