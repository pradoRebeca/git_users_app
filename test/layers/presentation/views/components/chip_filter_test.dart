import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:git_users_app/layers/presentation/views/components/chip_filter.dart';

void main() {
  testWidgets(
      'ChipFilter displays icon, label, and calls onClear on button press',
      (WidgetTester tester) async {
    const testIcon = Icons.filter_list;
    const testLabel = 'Filter';
    bool onClearCalled = false;

    void testOnClear() {
      onClearCalled = true;
    }

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ChipFilter(
            icon: testIcon,
            label: testLabel,
            onClear: testOnClear,
          ),
        ),
      ),
    );

    final iconFinder = find.byIcon(testIcon);

    expect(iconFinder, findsOneWidget);

    final labelFinder = find.text(testLabel);

    expect(labelFinder, findsOneWidget);

    final clearButtonFinder = find.byIcon(Icons.cancel);

    expect(clearButtonFinder, findsOneWidget);

    await tester.tap(clearButtonFinder);
    await tester.pump();

    expect(onClearCalled, isTrue);
  });
}
