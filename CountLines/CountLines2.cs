using System;
using System.IO;
using System.Linq;

public class CountLines2
{

  // http://stackoverflow.com/a/119572/5086987
  private static int CountLines( string filename )
  {
    return File.ReadLines( filename ).Count();
  }

  public static void Main( string[] arguments )
  {
    Console.WriteLine( CountLines( arguments[ 0 ] ) );
  }

}
