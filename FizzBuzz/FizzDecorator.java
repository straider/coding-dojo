// Compile command: javac FizzDecorator.java

public class FizzDecorator extends Decorator {

  public FizzDecorator( final Decoder decoder ) {
    super( 3, "Fizz", decoder );
  }

}