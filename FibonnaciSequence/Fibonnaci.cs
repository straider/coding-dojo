using System;
using System.Collections.Generic;

public class Fibonnaci
{

  private static List< int > fibonnaci( int value )
  {
    List< int > sequence = new List< int >();

    for ( int number = 0; number <= value ; number++ )
    {
      if ( number <= 1 )
      {
        sequence.Add( number );
      }
      else
      {
        int length = sequence.Count;
        sequence.Add( sequence[ length - 1 ] + sequence[ length - 2 ] );
      }
    }

    return sequence;
  }

  private const int LIMIT = 44;

  public static void Main( string[] arguments )
  {
    List< int > sequence = new List< int >();
    for ( int i = 0; i <= 25000; i++ )
    {
      sequence.AddRange( fibonnaci( LIMIT ) );
    }

    for ( int index = 0; index < sequence.Count; index++ )
    {
      int value = sequence[ index ];
      Console.WriteLine( string.Format( "{0:D2}: {1,9:D}", index % ( LIMIT + 1 ), value ) );
    }
  }

}
