// Compile command: javac ObjectOrientedV3a.java
// Execute command: java ObjectOrientedV3a

public class ObjectOrientedV3a {

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