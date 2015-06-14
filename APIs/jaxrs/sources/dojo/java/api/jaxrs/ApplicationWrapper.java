package dojo.java.api.jaxrs;

import java.util.Set;
import java.util.HashSet;

import javax.ws.rs.ApplicationPath;
import javax.ws.rs.core.Application;

@ApplicationPath( "/rest" )
public class ApplicationWrapper extends Application {

	@Override
	public Set< Class< ? > > getClasses() {
		Set< Class < ? > > classes = new HashSet< Class< ? > >();

		classes.add( Greeter.class );
		classes.add( ChecksumService.class );

		return classes;
	}

}
