public class ObjectOriented {

  private final String name;

  public ObjectOriented() {
    name = "World";
  }

  public ObjectOriented( final String name ) {
    this.name = name;
  }

  public String say() {
    return "Hello, " + name + "!";
  }

  public static void main( final String[] arguments ) {
    final ObjectOriented greeter;
    if ( arguments.length == 0 ) {
      greeter = new ObjectOriented();
    } else {
      greeter = new ObjectOriented( arguments[ 0 ] );
    }

    System.out.println( greeter.say() );
    System.out.println( "» José Carlos Monteiro «" );
  }

}