// Compile command: msc Procedural.cs
// Execute commands:
//   mono Procedural
//   mono Procedural "José Carlos Monteiro"
//   mono Procedural Universe

using System;

public class Procedural
{

  public static void Main( string[] arguments )
  {
    string name = ( arguments.Length == 0 ) ? "World" : arguments[ 0 ];
    Console.WriteLine( "Hello, " + name + "!" );

    Console.WriteLine( "» José Carlos Monteiro «" );
  }

}