import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/course_provider.dart';

class AddCourseForm extends StatefulWidget {
  const AddCourseForm({super.key});

  @override
  State<AddCourseForm> createState() => _AddCourseFormState();
}

class _AddCourseFormState extends State<AddCourseForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _instructorController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Course"),
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
                      _addCourseFunction(context);
                    },
                    child: Text(
                      "Add Course",
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

  void _addCourseFunction(BuildContext context) {
    // random number generator
    var random = Random();

    if (_formKey.currentState!.validate()) {
      final course = Course(
        id: random.nextInt(100),
        name: _nameController.text,
        description: _descriptionController.text,
        instructor: _instructorController.text,
      );
      final provider = Provider.of<CourseProvider>(context, listen: false);
      provider.addCourse(course);
      Navigator.pop(context);
    }
  }
}
