import 'package:flutter/cupertino.dart';

import '../providers/counter_change_notifier.dart';

class CounterProvider extends InheritedWidget {
  final Widget child;
  final CounterNotifier notifier;
  final String appName;

  CounterProvider({
    required this.appName,
    required this.child,
    required this.notifier,
  }) : super(child: child);

  static CounterProvider? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<CounterProvider>();
  }

  static CounterProvider of(BuildContext context) {
    final CounterProvider? result = maybeOf(context);
    assert(result != null, 'No CounterProvider found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(CounterProvider oldWidget) {
    return notifier != oldWidget.notifier; // compare notifier
  }
}
