import 'package:flutter/material.dart';

import '../inherit/counter_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    var counterProvider =
        CounterProvider.of(context).notifier; // instance of CounterNotifier
    counterProvider.addListener(onCounterChange);
    super.didChangeDependencies();
  }

  void onCounterChange() {
    setState(() {});
  }

  @override
  void dispose() {
    var counterProvider =
        CounterProvider.of(context).notifier; // instance of CounterNotifier
    counterProvider.removeListener(onCounterChange);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var counterProvider =
        CounterProvider.of(context).notifier; // instance of CounterNotifier
    return Scaffold(
      appBar: AppBar(
        title: Text(CounterProvider.of(context).appName),
      ),
      body: Center(
        child: Column(
          children: [
            Text('Counter: ${counterProvider.counter}'),
            Container(
              height: 100,
              width: 100,
              color: Colors.blue,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('Counter1: ${counterProvider.counter}');
          counterProvider.incrementCounter = counterProvider.counter + 1;
          print('Counter2: ${counterProvider.counter}');
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
