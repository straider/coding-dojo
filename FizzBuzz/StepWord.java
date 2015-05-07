// Compile command: javac StepWord.java

public class StepWord extends StepChain {

  private final Integer prime;
  private final String  word ;

  public StepWord( final Integer prime, final String word ) {
    this.prime = prime;
    this.word  = word ;
  }

  @Override
  public void execute( final Integer value ) {
    if ( value % prime == 0 ) {
      words.add( word );
    }

    nextStep.execute( value );
  }

}