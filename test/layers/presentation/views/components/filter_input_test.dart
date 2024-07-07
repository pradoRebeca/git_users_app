import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:git_users_app/layers/presentation/views/components/filter_input.dart';

void main() {
  testWidgets('FilterInput correctly renders icon, label and text field',
      (WidgetTester tester) async {
    final TextEditingController controller = TextEditingController();
    const IconData testIcon = Icons.search;
    const String testLabel = 'Search';
    const TextInputType testInputType = TextInputType.text;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: FilterInput(
            filterController: controller,
            icon: testIcon,
            label: testLabel,
            inputType: testInputType,
          ),
        ),
      ),
    );

    expect(find.byIcon(testIcon), findsOneWidget);

    expect(find.text(testLabel), findsOneWidget);

    final textFieldFinder = find.byType(TextField);
    expect(textFieldFinder, findsOneWidget);
    final TextField textField = tester.widget(textFieldFinder);
    expect(textField.controller, controller);

    expect(textField.keyboardType, testInputType);
  });
}
