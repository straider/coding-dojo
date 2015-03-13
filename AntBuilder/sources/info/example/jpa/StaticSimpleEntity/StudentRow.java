package info.example.jpa.StaticSimpleEntity;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.Id;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.SequenceGenerator;
import javax.persistence.Temporal;

@Entity
@Table( name = StudentRow.TABLE_NAME )
public class StudentRow implements Serializable {

  final public static String TABLE_NAME = "STUDENTS";

  @Id
  @GeneratedValue( strategy = GenerationType.SEQUENCE, generator = TABLE_NAME + "_SEQ" )
  @SequenceGenerator( name           = TABLE_NAME + "_SEQ"
                    , sequenceName   = TABLE_NAME + "_SEQ"
                    , initialValue   = 1
                    , allocationSize = 1
                    )
  public Integer id;
  public String  first_name;
  public String  last_name;
  public String  full_name;
  public String  gender;
  @Temporal( javax.persistence.TemporalType.TIMESTAMP )
  public Date    birthday;
  public Integer class_level;
  public Double  grade;

  public StudentRow() {
  }

  @Override
  public String toString() {
    final String student = "ID #" + id
                         + ", firstName = "  + first_name
                         + ", lastName = "   + last_name
                         + ", fullName = "   + full_name
                         + ", gender = "     + gender
                         + ", borned on = "  + birthday
                         + ", at level = "   + class_level
                         + ", with grade = " + grade
                         ;

    return student;
  }

}