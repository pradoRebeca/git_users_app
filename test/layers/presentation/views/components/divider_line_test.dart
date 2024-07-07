import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:git_users_app/layers/presentation/views/components/divider_line.dart';

void main() {
  testWidgets('DividerLine displays a gradient with correct colors and height',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: Colors.blue,
          ),
        ),
        home: const Scaffold(
          body: DividerLine(),
        ),
      ),
    );

    final containerFinder = find.byType(Container);
    expect(containerFinder, findsOneWidget);

    final containerWidget = tester.widget<Container>(containerFinder);
    expect(containerWidget.constraints?.minHeight, 1);

    final boxDecoration = containerWidget.decoration as BoxDecoration;
    final linearGradient = boxDecoration.gradient as LinearGradient;
    final expectedColors = [
      Colors.blue.withOpacity(0.1),
      Colors.blue.withOpacity(0.2),
      Colors.blue,
      Colors.blue.withOpacity(0.2),
      Colors.blue.withOpacity(0.1),
    ];

    expect(linearGradient.colors, expectedColors);
  });
}
