import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class Course extends Equatable {
  final String name;
  final String description;

  Course({required this.name, required this.description});

  @override
  List<Object?> get props => [name, description];
}

class CourseProvider extends ChangeNotifier {
  // read
  // create
  // update
  // delete
}
