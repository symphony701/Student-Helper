import 'package:personal_ui/model/course.dart';

class Schedule {
  int? id;
  int? horaInicio;
  int? horaFin;
  String? dia;
  int? courseId;

  Schedule(
      {this.id = 0, this.horaInicio, this.horaFin, this.dia, this.courseId});

  Map<String, dynamic> toMap() {
    return {
      'horaInicio': horaInicio,
      'horaFin': horaFin,
      'dia': dia,
      'courseId': courseId,
    };
  }

  Schedule.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    horaInicio = map['horaInicio'];
    horaFin = map['horaFin'];
    dia = map['dia'];
    courseId = map['courseId'];
  }
}
