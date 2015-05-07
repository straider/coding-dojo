// Compile command: javac StepFizz.java

public class StepFizz extends StepChain {

  private final Integer prime;
  private final String  word ;

  public StepFizz() {
    this.prime =      3;
    this.word  = "Fizz";
  }

  @Override
  public void execute( final Integer value ) {
    if ( value % prime == 0 ) {
      words.add( word );
    }

    nextStep.execute( value );
  }

}