import 'package:flutter/material.dart';

import '../providers/course_provider.dart';

class CourseItemCard extends StatelessWidget {
  const CourseItemCard({super.key, required this.course});

  final Course course;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          child: Text(course.id.toString()),
        ),
        title: Text("Course ${course.name}"),
        subtitle: Text("Course ${course.description} by ${course.instructor}"),
        trailing: Icon(Icons.arrow_forward_ios),
      ),
    );
  }
}
