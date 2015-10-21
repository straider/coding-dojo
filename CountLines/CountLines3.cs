using System;
using System.IO;
using System.Linq;

public class CountLines3
{

  // http://stackoverflow.com/q/6101367/5086987
  private static int CountLines( string filename )
  {
    byte END_OF_LINE = Convert.ToByte( '\n' );
    int  BUFFER_SIZE = 8 * 1024;

    byte[] buffer = new byte[ BUFFER_SIZE ];
    using ( var reader = File.OpenRead( filename ) )
    {
      int lines = 0;

      bool hasCharacters = false;

      int bytes = 0;
      while ( ( bytes = reader.Read( buffer, 0, BUFFER_SIZE ) ) > 0 )
      {
        lines += buffer.Where( a => a == END_OF_LINE ).Count();
        hasCharacters = buffer[ bytes - 1 ] != '\n';
      }
      if ( hasCharacters ) {
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
