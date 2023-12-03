import 'package:flutter/material.dart';
import 'package:flutter_state_app/models/app_config.dart';
import 'package:flutter_state_app/pages/course_page.dart';
import 'package:flutter_state_app/pages/home_page.dart';
import 'package:flutter_state_app/pages/student_page.dart';
import 'package:flutter_state_app/providers/course_provider.dart';
import 'package:flutter_state_app/providers/person_provider.dart';
import 'package:flutter_state_app/providers/student_provider.dart';
import 'package:flutter_state_app/providers/theme_provider.dart';
import 'package:provider/provider.dart';

import 'common/themes/color_schemes.g.dart';
import 'providers/language_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<LanguageProvider>(
          create: (context) => LanguageProvider()..init(),
        ),
        ChangeNotifierProvider<ThemeProvider>(
          create: (context) => ThemeProvider()..init(),
        ),
        Provider<AppConfig>(
          create: (context) => AppConfig(appName: "Instinct App"),
        ),
        ChangeNotifierProvider<PersonProvider>(
          create: (context) => PersonProvider(),
        ),
        ChangeNotifierProvider<StudentProvider>(
          create: (context) => StudentProvider(),
        ),
        ChangeNotifierProvider<CourseProvider>(
          create: (context) => CourseProvider(),
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
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          theme: ThemeData(
            useMaterial3: true,
            colorScheme: lightColorScheme,
          ),
          darkTheme: ThemeData(
            useMaterial3: true,
            colorScheme: darkColorScheme,
          ),
          // themeMode:
          //     themeProvider.isDarkMode ? ThemeMode.dark : ThemeMode.light,
          themeMode: ThemeMode.system,
          home: CoursePage(),
        );
      },
    );
  }
}
