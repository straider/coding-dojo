// Compile command: javac -encoding "UTF-8" ObjectOriented.java
// Execute commands:
//   java -Dfile.encoding="UTF-8" ObjectOriented
//   java -Dfile.encoding="UTF-8" ObjectOriented "José Carlos Monteiro"
//   java -Dfile.encoding="UTF-8" ObjectOriented Universe

public class ObjectOriented {

  private final String name;

  public ObjectOriented() {
    name = "World";
  }

  public ObjectOriented( final String name ) {
    this.name = name;
  }

  public String say() {
    return String.format( "Hello, %s!", name );
  }

  public static void main( final String[] arguments ) {
    final ObjectOriented greeter = ( arguments.length == 0 ) ? new ObjectOriented() : new ObjectOriented( arguments[ 0 ] );
    System.out.println( greeter.say() );

    System.out.println( "» José Carlos Monteiro «" );
  }

}