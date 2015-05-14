// Compile command: msc Procedural3.cs
// Execute commands:
//   mono Procedural3
//   mono Procedural3 "José Carlos Monteiro"
//   mono Procedural3 Universe

using System;

public class Procedural3
{

  private const String MESSAGE = "Hello, {0}!\n";

  private static String Greet( String message, String name ) {
    return string.Format( message, name ); // String.Format is not procedural: it's a method of the object String.
  }

  private static String Greet( String message ) {
    return Greet( message, "World" );
  }

  public static void Main( string[] arguments )
  {
    string greeting = ( arguments.Length == 0 ) ? Greet( MESSAGE ) : Greet( MESSAGE, arguments[ 0 ] ); // Array.Length is not procedural: it's a property of the object Array.
    Console.WriteLine( greeting );

    Console.WriteLine( "» José Carlos Monteiro «" );
  }

}