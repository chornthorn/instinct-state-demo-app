import 'package:flutter/widgets.dart';

class CounterNotifier extends ChangeNotifier {
  int _counter = 2; // setter and getter

  int get counter => _counter; // getter

  set incrementCounter(int counter) {
    this._counter = counter;
    notifyListeners();
  }
}
