import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:git_users_app/layers/presentation/bindings/history_binding.dart';
import 'package:git_users_app/layers/presentation/bindings/user_search_binding.dart';
import 'package:git_users_app/layers/presentation/views/screens/history_screen.dart';
import 'package:git_users_app/layers/presentation/views/screens/search_user_screen.dart';
import 'package:git_users_app/theme/app_theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Git Users App',
      initialRoute: '/',
      theme: AppTheme.theme,
      getPages: [
        GetPage(
          name: '/',
          page: () => SearchScreen(),
          binding: SearchUserBinding(),
        ),
        GetPage(
          name: '/history',
          page: () => const HistoryScreen(),
          binding: HistoryBinding(),
        )
      ],
    );
  }
}