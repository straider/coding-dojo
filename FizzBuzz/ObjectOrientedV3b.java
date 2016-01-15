// Compile command: javac ObjectOrientedV3b.java
// Execute command: java ObjectOrientedV3b

public class ObjectOrientedV3b {

  public static void main( final String[] arguments ) {
    final NumberWord    decoder = new NumberWord();
    final DazzDecorator dazz    = new DazzDecorator( decoder );
    final BuzzDecorator buzz    = new BuzzDecorator( dazz    );
    final FizzDecorator fizz    = new FizzDecorator( buzz    );

    for ( int i = 1; i <= 100; i++ ) {
      final String line = fizz.say( i );

      System.out.println( line );
    }
  }

}