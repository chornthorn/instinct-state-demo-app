import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class Course extends Equatable {
  final int id;
  final String name;
  final String? description; // optional
  final String instructor;

  Course(
      {required this.id,
      required this.name,
      this.description,
      required this.instructor});

  @override
  List<Object?> get props => [id, name, description, this.instructor];
}

class CourseProvider extends ChangeNotifier {
  final List<Course> _courses = [
    Course(
      id: 1,
      name: "Flutter",
      description: "Flutter is a UI toolkit by Google",
      instructor: "Google",
    ),
    Course(
      id: 2,
      name: "React",
      description: "React is a UI library by Facebook",
      instructor: "Facebook",
    ),
  ];
  List<Course> get courses => _courses;

  Course? _course;
  Course? get course => _course;

  // Create operation
  void addCourse(Course course) {
    _courses.add(course);
    notifyListeners();
  }

  // read operation
  void getCourse(int id) {
    _course = _courses.firstWhere((course) => course.id == id);
    notifyListeners();
  }

  // Update operation
  void updateCourse(int id, Course course) {
    int index = _courses.indexWhere((course) => course.id == id);
    if (index != -1) {
      _courses[index] = course;
      notifyListeners();
    }
  }

  // Delete operation
  void deleteCourse(int id) {
    _courses.removeWhere((course) => course.id == id);
    notifyListeners();
  }
}
