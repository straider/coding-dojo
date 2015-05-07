// Compile command: javac StepNumber.java

public class StepNumber extends StepChain {

  @Override
  public void execute( final Integer value ) {
    if ( words.size() == 0 ) {
      words.add( String.format( "%04d", value ) );
    }
  }

}