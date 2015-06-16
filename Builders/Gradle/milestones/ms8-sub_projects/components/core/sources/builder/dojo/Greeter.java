package builder.dojo;

public class Greeter {

  private final String name;

  public Greeter() {
    name = "World";
  }

  public Greeter( final String name ) {
    this.name = name;
  }

  public String greet() {
    return String.format( "Hello, %s!", name );
  }

}