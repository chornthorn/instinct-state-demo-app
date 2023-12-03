import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/course_provider.dart';

class UpdateCourseForm extends StatefulWidget {
  const UpdateCourseForm({super.key, required this.course});

  final Course course;

  @override
  State<UpdateCourseForm> createState() => _UpdateCourseFormState();
}

class _UpdateCourseFormState extends State<UpdateCourseForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _instructorController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _nameController.text = widget.course.name;
    _descriptionController.text = widget.course.description ?? "";
    _instructorController.text = widget.course.instructor;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Update Course"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      labelText: "Name",
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter course name";
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _descriptionController,
                    decoration: InputDecoration(
                      labelText: "Description",
                    ),
                  ),
                  TextFormField(
                    controller: _instructorController,
                    decoration: InputDecoration(
                      labelText: "Instructor",
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter course instructor";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      _addCourseFunction(widget.course.id);
                    },
                    child: Text(
                      "Update Course",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _addCourseFunction(int id) {
    if (_formKey.currentState!.validate()) {
      final course = Course(
        id: id,
        name: _nameController.text,
        description: _descriptionController.text,
        instructor: _instructorController.text,
      );
      final provider = Provider.of<CourseProvider>(context, listen: false);
      provider.updateCourse(id, course);
      Navigator.pop(context);
    }
  }
}
