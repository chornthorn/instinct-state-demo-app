import 'package:flutter/material.dart';

import '../models/student.dart';

class StudentProvider extends ChangeNotifier {
  // get student from API

  List<Student> _students = [
    Student(id: 1, name: 'John Doe', email: 'jonh@gmail.com', age: 20),
    Student(id: 2, name: 'Jane Doe', email: 'jane@gmail.com', age: 21),
  ];

  List<Student> get students => _students; // getter

  void addStudent(Student student) {
    _students.add(student);
    // call API to add student
    notifyListeners();
  }
}
