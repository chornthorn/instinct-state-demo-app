import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../inherit/counter_provider.dart';
import '../models/app_config.dart';
import '../providers/person_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            'App Name: ${Provider.of<AppConfig>(context, listen: false).appName}'),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
                'Person name: ${Provider.of<PersonProvider>(context, listen: false).email}'),
            Container(
              height: 100,
              width: 100,
              color: Colors.blue,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }
}
