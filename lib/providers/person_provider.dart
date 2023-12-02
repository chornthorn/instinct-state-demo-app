import 'package:flutter/material.dart';

class PersonProvider extends ChangeNotifier {
  String _name = 'John Doe';
  String _email = 'jonh@gmail.com';

  String get name => _name;
  String get email => _email;
}
