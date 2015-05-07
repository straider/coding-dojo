// Compile command: javac StepBuzz.java

public class StepBuzz extends StepChain {

  private final Integer prime;
  private final String  word ;

  public StepBuzz() {
    this.prime =      5;
    this.word  = "Buzz";
  }

  @Override
  public void execute( final Integer value ) {
    if ( value % prime == 0 ) {
      words.add( word );
    }

    nextStep.execute( value );
  }

}