import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.DriverManager;
import java.sql.SQLException;

public class InformixSchemaObjectLister {

  public static void main( final String[] arguments ) throws SQLException, ClassNotFoundException {
    Class.forName( "com.informix.jdbc.IfxDriver" );
    final Connection       connection = DriverManager.getConnection( "jdbc:informix-sqli://ajdixs08.tmn.pt:15090/roaming:INFORMIXSERVER=valor_dsv_1", "tap3", "tap2000" );
    final DatabaseMetaData meta       = connection.getMetaData();

    System.out.println( "JDBC Major Version: "     + meta.getJDBCMajorVersion       () );
    System.out.println( "JDBC Minor Version: "     + meta.getJDBCMinorVersion       () );

    System.out.println( "Driver Name: "            + meta.getDriverName             () );
    System.out.println( "Driver Version: "         + meta.getDriverVersion          () );
    System.out.println( "Driver Major Version: "   + meta.getDriverMajorVersion     () );
    System.out.println( "Driver Minor Version: "   + meta.getDriverMinorVersion     () );

    System.out.println( "DataBase Name: "          + meta.getDatabaseProductName    () );
    System.out.println( "DataBase Version: "       + meta.getDatabaseProductVersion () );
    System.out.println( "DataBase Major Version: " + meta.getDatabaseMajorVersion   () );
    System.out.println( "DataBase Minor Version: " + meta.getDatabaseMinorVersion   () );

    System.out.println( "Connection String: "      + meta.getURL                () );
    System.out.println( "User Name: "              + meta.getUserName           () );

    connection.close();
  }

}
