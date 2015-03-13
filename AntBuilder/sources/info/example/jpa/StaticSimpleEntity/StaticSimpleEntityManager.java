package info.example.jpa.StaticSimpleEntity;

import java.util.Date;
import java.util.List;

import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityManager;
import javax.persistence.Persistence;
import javax.persistence.TypedQuery;

public class StaticSimpleEntityManager {

  private static EntityManagerFactory factory;

  public static void main( final String[] arguments ) {
    if ( arguments.length == 1 ) {
      final String persistenceUnitName = arguments[ 0 ];

      factory = Persistence.createEntityManagerFactory( persistenceUnitName );

      final EntityManager entityManager = factory.createEntityManager();

      final TypedQuery< StudentRow > query    = entityManager.createQuery( "SELECT s FROM StudentRow s", StudentRow.class );
      final List< StudentRow >       students = query.getResultList();
      for ( final StudentRow student : students ) {
        System.out.println( student );
      }
      System.out.println( "Total number of students = " + students.size() );

      entityManager.getTransaction().begin();
      final StudentRow student = new StudentRow();
      student.first_name  = "José";
      student.last_name   = "Monteiro";
      student.full_name   = "José Carlos Monteiro";
      student.gender      = "M";
      student.birthday    = new Date();
      student.class_level = 4;
      entityManager.persist( student );
      System.out.println( "New student: " + student );
      entityManager.getTransaction().commit();

      final Integer newID = student.id;

      final StudentRow newStudent = ( StudentRow ) entityManager.find( StudentRow.class, newID );
      System.out.println( "Found student: " + newStudent );

      entityManager.close();
    } else {
      System.out.println( "Usage: " + StaticSimpleEntityManager.class + " <persistenceUnitName>" );
    }
  }

}
