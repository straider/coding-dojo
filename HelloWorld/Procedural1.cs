// Compile command: msc Procedural1.cs
// Execute commands:
//   mono Procedural1
//   mono Procedural1 "José Carlos Monteiro"
//   mono Procedural1 Universe

using System;

public class Procedural1
{

  public static void Main( string[] arguments )
  {
    string name = ( arguments.Length == 0 ) ? "World" : arguments[ 0 ];
    Console.WriteLine( "Hello, " + name + "!" );

    Console.WriteLine( "» José Carlos Monteiro «" );
  }

}