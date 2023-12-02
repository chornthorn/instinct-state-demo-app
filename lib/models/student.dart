import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
class Student extends Equatable {
  final int id;
  final String name;
  final String? email;
  final int? age;

  const Student({
    required this.id,
    required this.name,
    this.email,
    this.age,
  });

  @override
  List<Object?> get props => [id, name, email, age];
}
