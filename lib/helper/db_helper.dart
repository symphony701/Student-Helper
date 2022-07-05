import 'package:path/path.dart';
import 'package:personal_ui/model/course.dart';
import 'package:personal_ui/model/schedule.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

class DbHelper {
  final int version = 2;
  Database? db;
  static final DbHelper _dbHelper = DbHelper._internal();

  DbHelper._internal();

  factory DbHelper() {
    return _dbHelper;
  }

  Future<Database> openDb() async {
    db ??=
        await openDatabase(join(await getDatabasesPath(), 'student_helper.db'),
            onCreate: (db, version) {
      db.execute(
          'CREATE TABLE courses(id INTEGER PRIMARY KEY AUTOINCREMENT, courseName TEXT, color TEXT)');
      db.execute(
          'CREATE TABLE schedules(id INTEGER PRIMARY KEY AUTOINCREMENT, horaInicio INTEGER, horaFin INTEGER, dia TEXT, courseId INTEGER, FOREIGN KEY(courseId) REFERENCES courses(id))');
    }, version: version);
    return db!;
  }

  Future<void> closeDb() async {
    db?.close();
  }

  Future<int> insertCourse(Course course) async {
    int id = await db!.insert('courses', course.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    return id;
  }

  Future<List<Course>> getCourses() async {
    final database = await openDb();
    final List<Map<String, dynamic>> maps =
        await database.query('courses', columns: ['id', 'courseName', 'color']);
    return List.generate(maps.length, (i) {
      return Course(
        id: maps[i]['id'],
        courseName: maps[i]['courseName'],
        color: maps[i]['color'],
      );
    });
  }

  Future<int> insertSchedule(Schedule schedule) async {
    int id = await db!.insert('schedules', schedule.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    return id;
  }
}
