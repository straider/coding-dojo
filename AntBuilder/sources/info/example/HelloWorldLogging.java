package info.example;

import org.apache.log4j.Logger;
import org.apache.log4j.BasicConfigurator;

public class HelloWorldLogging {

  protected static final Logger logger = Logger.getRootLogger();
  
  public static void main( final String[] arguments ) {
    BasicConfigurator.configure();
    
    logger.info( "Hello, World!" );
  }
  
}