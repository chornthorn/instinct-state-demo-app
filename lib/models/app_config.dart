import 'package:equatable/equatable.dart';

class AppConfig extends Equatable {
  final String appName;

  AppConfig({required this.appName});

  @override
  List<Object?> get props => [appName];
}
