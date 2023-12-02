import 'package:flutter/material.dart';
import 'package:flutter_state_app/providers/student_provider.dart';
import 'package:provider/provider.dart';

import '../models/student.dart';

class StudentPage extends StatefulWidget {
  const StudentPage({super.key});

  @override
  State<StudentPage> createState() => _StudentPageState();
}

class _StudentPageState extends State<StudentPage> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student list'),
      ),
      body: Consumer<StudentProvider>(
        builder: (BuildContext context, provider, Widget? child) {
          return ListView.builder(
            itemCount: provider.students.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(provider.students[index].name),
                subtitle: Text(provider.students[index].email ?? ''),
                trailing: Text(provider.students[index].age.toString()),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddStudentForm(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  // add student form
  void _showAddStudentForm(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add student'),
          content: AddStudentForm(
            nameController: _nameController,
            emailController: _emailController,
            ageController: _ageController,
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                _addStudent(context);
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }

  void _addStudent(BuildContext context) {
    final provider = Provider.of<StudentProvider>(
      context,
      listen: false,
    );
    final name = _nameController.text;
    final email = _emailController.text;
    final age = int.parse(_ageController.text);
    final student = Student(
      id: provider.students.length + 1,
      name: name,
      email: email,
      age: age,
    );
    provider.addStudent(student);
    Navigator.of(context).pop();
    _clearTextField();
  }

  // clear text field
  void _clearTextField() {
    _nameController.clear();
    _emailController.clear();
    _ageController.clear();
  }
}

class AddStudentForm extends StatelessWidget {
  const AddStudentForm({
    super.key,
    required this.nameController,
    required this.emailController,
    required this.ageController,
  });

  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController ageController;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextField(
          controller: nameController,
          decoration: const InputDecoration(
            labelText: 'Name',
          ),
        ),
        TextField(
          controller: emailController,
          decoration: InputDecoration(
            labelText: 'Email',
          ),
        ),
        TextField(
          controller: ageController,
          decoration: InputDecoration(
            labelText: 'Age',
          ),
        ),
      ],
    );
  }
}
