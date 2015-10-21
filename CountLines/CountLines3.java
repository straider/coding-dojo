import java.io.InputStream;
import java.io.BufferedInputStream;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.FileNotFoundException;

public class CountLines3 {

  private static final int BUFFER_SIZE = 8 * 1024;

  // http://stackoverflow.com/a/453067/5086987
  // http://stackoverflow.com/a/14411695/5086987
  public static int countLines( final String filename ) {
    int lines = 0;

    InputStream stream = null;
    try {
      final byte[] buffer = new byte[ BUFFER_SIZE ];

      stream = new BufferedInputStream( new FileInputStream( filename ) );

      boolean hasCharacters = false;

      int bytes = 0;
      while ( ( bytes = stream.read( buffer ) ) != -1 ) {
        for ( int i = 0; i < bytes; i++ ) {
          if ( buffer[ i ] == '\n' ) {
            lines++;
          }
        }
        hasCharacters = buffer[ bytes - 1 ] != '\n';
      }
      if ( hasCharacters ) {
        lines++;
      }
    } catch ( final FileNotFoundException exception ) {
    } catch ( final IOException exception ) {
    } finally {
      if ( stream != null ) {
        try {
          stream.close();
        } catch ( final IOException exception ) {
        }
      }
    }

    return lines;
  }

  public static void main( final String[] arguments ) {
    System.out.println( countLines( arguments[ 0 ] ) );
  }

}
