import java.io.FileReader;
import java.io.LineNumberReader;
import java.io.IOException;
import java.io.FileNotFoundException;

public class CountLines1 {

  // http://stackoverflow.com/a/1647015/5086987
  // http://stackoverflow.com/a/1277955/5086987
  public static int countLines( final String filename ) {
    int lines = 0;

    try {
      final LineNumberReader reader = new LineNumberReader( new FileReader( filename ) );

      while ( reader.readLine() != null );
      lines = reader.getLineNumber();

      reader.close();
    } catch ( final FileNotFoundException exception ) {
    } catch ( final IOException exception ) {
    } finally {
    }

    return lines;
  }

  public static void main( final String[] arguments ) {
    System.out.println( countLines( arguments[ 0 ] ) );
  }

}
