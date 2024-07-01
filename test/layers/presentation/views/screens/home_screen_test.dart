import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:git_users_app/layers/presentation/views/screens/home_screen.dart';

void main() {
  group(
    'HomeScreen Test',
    () {
      Future<void> pumpHomeScreen(WidgetTester tester) async {
        await tester.pumpWidget(MaterialApp(
          home: HomeScreen(),
        ));
      }

      Future<void> openDrawer(WidgetTester tester) async {
        await tester.tap(find.byIcon(Icons.menu));

        await tester.pumpAndSettle();
      }

      Finder findImageByAssetName(String assetName) {
        return find.byWidgetPredicate(
          (widget) {
            if (widget is Image && widget.image is AssetImage) {
              AssetImage assetImage = widget.image as AssetImage;
              return assetImage.assetName == assetName;
            }
            return false;
          },
        );
      }

      group(
        'AppBar Test',
        () {
          testWidgets(
            'AppBar should contain Icon menu',
            (WidgetTester tester) async {
              await pumpHomeScreen(tester);

              var finder = find.byIcon(Icons.menu);

              expect(finder, findsOneWidget);
            },
          );

          testWidgets(
            'AppBar contain logo image',
            (WidgetTester tester) async {
              await pumpHomeScreen(tester);

              expect(findImageByAssetName('assets/images/logo/logo_purple.png'),
                  findsOneWidget);
            },
          );
        },
      );

      group(
        'Drawer Test',
        () {
          testWidgets(
            'Menu Icon - onClick Menu icon should open Drawer',
            (WidgetTester tester) async {
              await pumpHomeScreen(tester);

              await openDrawer(tester);

              //counting with navigationDrawer and NavigationDrawerDestination
              expect(find.byType(Drawer), findsNWidgets(2));
            },
          );

          testWidgets(
            'Drawer - should contain 2 NavigationDrawerDestination',
            (WidgetTester tester) async {
              await pumpHomeScreen(tester);

              await openDrawer(tester);

              expect(
                  find.byType(NavigationDrawerDestination), findsNWidgets(2));
            },
          );

          testWidgets(
            'DrawerHeader - contain logo image',
            (WidgetTester tester) async {
              await pumpHomeScreen(tester);

              await openDrawer(tester);

              expect(findImageByAssetName('assets/images/logo/logo_white.png'),
                  findsOneWidget);
            },
          );

          testWidgets(
            "NavigationDrawerDestination - Label 'Pesquisar' contain icon",
            (WidgetTester tester) async {
              await pumpHomeScreen(tester);

              await openDrawer(tester);

              var historyIcon = find.byIcon(Icons.history);

              expect(historyIcon, findsOneWidget);
            },
          );

          testWidgets(
            'NavigationDrawerDestination - Search contain icon',
            (WidgetTester tester) async {
              await pumpHomeScreen(tester);

              await openDrawer(tester);

              var searchIcon = find.byIcon(Icons.search);

              expect(searchIcon, findsOneWidget);
            },
          );
        },
      );
    },
  );
}
