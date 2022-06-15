import 'package:hive/hive.dart';
import 'package:personal_ui/model/course.dart';

class CourseService {
  late Box<Course> _course;

  Future<void> init() async {
    Hive.registerAdapter(CourseAdapter());
    _course = await Hive.openBox<Course>('course');
  }

  List<Course> getCourses() {
    return _course.values.toList();
  }

  void addCourse(Course course) {
    _course.add(course);
  }

  Future<void> removeCourse(Course course) async {
    final courseToRemove = _course.values
        .firstWhere((element) => element.courseName == course.courseName);
    await courseToRemove.delete();
  }
}
