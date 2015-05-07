// Compile command: javac StepChain.java

import java.util.List;
import java.util.ArrayList;

public abstract class StepChain {

  protected StepChain nextStep = null;

  protected static final List< String > words = new ArrayList< String >();

  public void setNext( final StepChain step ) {
    nextStep = step;
  }

  public Boolean hasNext() {
    return nextStep != null;
  }

  public String say() {
    String result = "";

    for ( final String word : words ) {
      result += word;
    }
    words.clear();

    return result;
  }

  public abstract void execute( final Integer value );

}