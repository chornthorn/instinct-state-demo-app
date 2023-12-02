import 'package:flutter/material.dart';
import 'package:flutter_state_app/models/app_config.dart';
import 'package:flutter_state_app/pages/home_page.dart';
import 'package:flutter_state_app/pages/student_page.dart';
import 'package:flutter_state_app/providers/person_provider.dart';
import 'package:flutter_state_app/providers/student_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    // Provider<PersonProvider>(
    //   create: (context) => PersonProvider(),
    //   child: Provider<StudentProvider>(
    //     create: (context) => StudentProvider(),
    //     child: MyApp(),
    //   ),
    // ),

    MultiProvider(
      providers: [
        Provider<AppConfig>(
          create: (context) => AppConfig(appName: "Instinct App"),
        ),
        ChangeNotifierProvider<PersonProvider>(
          create: (context) => PersonProvider(),
        ),
        ChangeNotifierProvider<StudentProvider>(
          create: (context) => StudentProvider(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: StudentPage(),
    );
  }
}
