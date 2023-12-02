import 'package:flutter/widgets.dart';

class UserProvider extends InheritedWidget {
  final Widget child;
  final String name;

  UserProvider({
    required this.child,
    required this.name,
  }) : super(child: child);

  @override
  bool updateShouldNotify(covariant UserProvider oldWidget) {
    return name != oldWidget.name;
  }
}
