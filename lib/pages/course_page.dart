import 'package:flutter/material.dart';
import 'package:flutter_state_app/components/update_course_form.dart';
import 'package:flutter_state_app/providers/course_provider.dart';
import 'package:provider/provider.dart';

import '../components/add_course_form.dart';
import '../components/course_item_card.dart';

class CoursePage extends StatefulWidget {
  const CoursePage({super.key});

  @override
  State<CoursePage> createState() => _CoursePageState();
}

class _CoursePageState extends State<CoursePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Course Page"),
      ),
      body: CourseList(),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Person",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: "Course",
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final route = MaterialPageRoute(
            builder: (context) => AddCourseForm(),
          );
          Navigator.push(context, route);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class CourseList extends StatelessWidget {
  const CourseList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CourseProvider>(
      builder: (context, provider, child) {
        return ListView.builder(
          itemCount: provider.courses.length,
          padding: EdgeInsets.all(8),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                final route = MaterialPageRoute(
                  builder: (context) => UpdateCourseForm(
                    course: provider.courses[index], // course
                  ),
                );
                Navigator.push(context, route);
              },
              onLongPress: () {
                // alert dialog confirm delete
                _onConfirmDeleleteDialog(context, provider, index);
              },
              child: CourseItemCard(
                course: provider.courses[index],
              ),
            );
          },
        );
      },
    );
  }

  void _onConfirmDeleleteDialog(
      BuildContext context, CourseProvider provider, int index) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Delete Course"),
          content: Text("Are you sure you want to delete this course?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                provider.deleteCourse(provider.courses[index].id);
                Navigator.pop(context);
              },
              child: Text("Delete"),
            ),
          ],
        );
      },
    );
  }
}
