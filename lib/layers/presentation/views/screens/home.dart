import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:git_users_app/layers/presentation/controller/home_controller.dart';

class Home extends StatelessWidget {
  Home({super.key});

  final HomeController _controller = Get.put(HomeController());
  final String pathImageLogo = 'assets/images/logo';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Image.asset(
            '$pathImageLogo/logo_purple.png',
            fit: BoxFit.contain,
          ),
        ),
        actions: [
          Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: Icon(Icons.menu,
                    color: Theme.of(context).colorScheme.primary),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              );
            },
          ),
        ],
        title: Obx(
          () => Text(
            _controller.currentScreenData.title,
            style: TextStyle(
              color: Theme.of(context).colorScheme.onPrimary,
            ),
          ),
        ),
      ),
      body: Obx(
        () => _controller.currentScreenData.widget,
      ),
      drawer: Drawer(
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: DrawerHeader(
                decoration:
                    BoxDecoration(color: Theme.of(context).colorScheme.primary),
                child: Center(
                  child: SizedBox(
                    width: 50,
                    height: 50,
                    child: Image.asset(
                      '$pathImageLogo/logo_white.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Obx(
                () => NavigationDrawer(
                  selectedIndex: _controller.getSelectedIndex,
                  onDestinationSelected: _controller.setSelectedIndex,
                  children: [
                    ..._controller.listScreens
                        .map((screen) => NavigationDrawerDestination(
                              icon: Icon(screen.icon),
                              label: Text(screen.title),
                            ))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
