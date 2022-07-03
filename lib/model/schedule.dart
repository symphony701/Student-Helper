import 'package:objectbox/objectbox.dart';
import 'package:personal_ui/model/course.dart';

@Entity()
class Schedule {
  int id = 0;
  int horaInicio;
  int horaFin;
  String dia;
  final course = ToOne<Course>();

  Schedule(this.horaInicio, this.horaFin, this.dia);
}
