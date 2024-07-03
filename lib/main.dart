import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:git_users_app/layers/presentation/bindings/home_binding.dart';
import 'package:git_users_app/layers/presentation/bindings/user_search_binding.dart';
import 'package:git_users_app/layers/presentation/views/screens/search_user_screen.dart';
import 'package:git_users_app/theme/app_theme.dart';
import 'package:git_users_app/layers/presentation/views/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Git Users App',
      initialRoute: '/',
      theme: AppTheme.theme,
      getPages: [
        GetPage(
            name: '/',
            page: () => HomeScreen(),
            binding: HomeBinding(),
            bindings: [SearchUserBinding()]),
        GetPage(
          name: '/search',
          page: () => SearchScreen(),
        ),
      ],
    );
  }
}
