import java.io.FileReader;
import java.io.BufferedReader;
import java.io.Reader;
import java.io.StreamTokenizer;
import java.io.IOException;
import java.io.FileNotFoundException;

public class CountLines2 {

  // http://www.codecodex.com/wiki/Count_the_number_of_lines_in_a_text_file#Java
  public static int countLines( final String filename ) {
    int lines = 0;

    try {
      final Reader          reader = new BufferedReader( new FileReader( filename ) );
      final StreamTokenizer stream = new StreamTokenizer( reader );

      while ( stream.nextToken() != StreamTokenizer.TT_EOF );

      lines = stream.lineno() - 1;
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
