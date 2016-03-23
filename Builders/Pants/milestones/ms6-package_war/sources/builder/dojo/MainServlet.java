package builder.dojo;

import java.io.PrintWriter;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MainServlet extends HttpServlet {

  @Override
  public void init() throws ServletException {
    // XPTS419 - 2015.06.12: Mandatory Initialization Logic.
    super.init();
  }

  public MainServlet() {
    super();
  }

  @Override
  public void doGet( final HttpServletRequest  request
                   , final HttpServletResponse response )
      throws ServletException
           , IOException
  {
    response.setContentType( "text/plain" );
    final PrintWriter out = response.getWriter();

    out.println( new Greeter().greet() );

    out.println( "» José Carlos Monteiro «" );
  }

  @Override
  public void destroy() {
    // XPTS419 - 2015.06.12: Mandatory Destruction Logic.
    super.destroy();
  }

}