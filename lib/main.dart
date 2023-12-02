import 'package:flutter/material.dart';
import 'package:flutter_state_app/inherit/counter_provider.dart';
import 'package:flutter_state_app/pages/home_page.dart';

import 'providers/counter_change_notifier.dart';

void main() {
  runApp(
    CounterProvider(
      notifier: CounterNotifier(), // initialize the provider
      appName: 'Inherited Widget update',
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
      home: HomePage(),
    );
  }
}
