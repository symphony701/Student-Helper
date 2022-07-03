import 'package:personal_ui/model/course.dart';
import 'package:personal_ui/objectbox.g.dart';

class CourseDatabase {
  late final Store _store;
  late final Box<Course> _courseBox;

  Future<void> loadStore() async {
    _store = await openStore();
    print('abri la caja');
    _courseBox = _store.box<Course>();
  }

  List<Course> loadCourses() {
    return _courseBox.getAll();
  }

  List<Course> addCourse(Course newCourse) {
    _courseBox.put(newCourse);
    return loadCourses();
  }
}
