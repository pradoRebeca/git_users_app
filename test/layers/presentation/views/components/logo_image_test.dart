import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:git_users_app/layers/presentation/views/components/logo_image.dart';

void main() {
  testWidgets('LogoImage displays the image correctly',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: LogoImage(),
        ),
      ),
    );

    final paddingFinder = find.byType(Padding);
    expect(paddingFinder, findsOneWidget);

    final Padding padding = tester.widget(paddingFinder);
    expect(padding.padding, const EdgeInsets.all(13.0));

    final imageFinder = find.byType(Image);
    expect(imageFinder, findsOneWidget);

    final Image image = tester.widget(imageFinder);
    expect(
        (image.image as AssetImage).assetName, 'assets/images/logo_purple.png');
    expect(image.fit, BoxFit.contain);
  });
}
