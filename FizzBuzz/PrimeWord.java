// Compile command: javac PrimeWord.java

public class PrimeWord {

  private final Integer prime;
  private final String  word ;

  public PrimeWord( final Integer prime, final String word ) {
    this.prime = prime;
    this.word  = word ;
  }

  public String say( final Integer value ) {
    return ( value % prime == 0 ) ? word : "";
  }

}