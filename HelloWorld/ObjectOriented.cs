// Compile command: mcs ObjectOriented.cs
// Execute commands:
//   ObjectOriented
//   ObjectOriented "José Carlos Monteiro"
//   ObjectOriented Universe

using System;

public class ObjectOriented
{

  private string name;

  public ObjectOriented()
  {
    name = "World";
  }

  public ObjectOriented( String name )
  {
    this.name = name;
  }

  public string say()
  {
    return String.Format( "Hello, {0}!", name );
  }

  public static void Main( string[] arguments )
  {
    ObjectOriented greeter = ( arguments.Length == 0 ) ? new ObjectOriented() : new ObjectOriented( arguments[ 0 ] );
    Console.WriteLine( greeter.say() );

    Console.WriteLine( "» José Carlos Monteiro «" );
  }

}