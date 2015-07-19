using System;

public class Factorial20
{

  private static long factorial( int value )
  {
    long result = 1;

    for ( int iteration = 1; iteration <= value ; iteration++ )
    {
      result = result * iteration;
    }

    return result;
  }

  public static void Main( string[] arguments )
  {
    for ( int i = 0; i <= 50000; i++ )
    {
      for ( int value = 0; value <= 100; value++ )
      {
        long result = Factorial20.factorial( value );
        Console.WriteLine( result );
      }
    }
  }

}
