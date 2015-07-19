using System;
using System.Numerics; // dmcs -reference:System.Numerics.dll -out:Factorial100-CS.exe Factorial100.cs

public class Factorial20
{

  private static BigInteger factorial( int value )
  {
    BigInteger result = 1;

    for ( int iteration = 1; iteration <= value ; iteration++ )
    {
      result = BigInteger.Multiply( result, iteration );
    }

    return result;
  }

  public static void Main( string[] arguments )
  {
    for ( int i = 0; i <= 50000; i++ )
    {
      for ( int value = 0; value <= 100; value++ )
      {
        BigInteger result = Factorial20.factorial( value );
        Console.WriteLine( result );
      }
    }
  }

}
