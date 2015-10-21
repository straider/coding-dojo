using System;
using System.IO;

public class CountLines1
{

  // http://stackoverflow.com/a/496699/5086987
  private static int CountLines( string filename )
  {
    using ( StreamReader reader = new StreamReader( filename ) )
    {
      int lines = 0;

      while ( reader.ReadLine() != null )
      {
        lines++;
      }

      return lines;
    }
  }

  public static void Main( string[] arguments )
  {
    Console.WriteLine( CountLines( arguments[ 0 ] ) );
  }

}
