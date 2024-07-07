import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:git_users_app/layers/presentation/views/components/tittle_card.dart';

void main() {
  testWidgets('TittleCard displays the title with correct style',
      (WidgetTester tester) async {
    const testTitle = 'Test Title';

    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: TittleCard(title: testTitle),
        ),
      ),
    );

    final textFinder = find.text(testTitle);

    expect(textFinder, findsOneWidget);

    final textWidget = tester.widget<Text>(textFinder);
    final textStyle = textWidget.style;

    final BuildContext context = tester.element(textFinder);
    final expectedStyle =
        Theme.of(context).textTheme.bodyLarge?.merge(TextStyle(
              color: Theme.of(context).colorScheme.onPrimary,
            ));

    expect(textStyle, expectedStyle);
  });
}
