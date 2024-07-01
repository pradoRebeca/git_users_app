import 'package:flutter/material.dart';
import 'package:git_users_app/layers/presentation/theme/app_theme.dart';
import 'package:git_users_app/layers/presentation/views/screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Git Users App',
      theme: AppTheme.theme,
      home: Home(),
    );
  }
}
