import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:git_users_app/layers/domain/models/dtos/search_dto.dart';
import 'package:git_users_app/layers/presentation/views/components/search_input.dart';

class MockCallback extends Mock {
  void call(QuerySearchDto querySearchDto);
}

void main() {
  testWidgets('SearchInput interacts correctly', (WidgetTester tester) async {
    // Cria mocks para os callbacks
    final mockOnClear = MockCallback();
    final mockOnSearchClick = MockCallback();

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: SearchInput(
            initialText: 'teste',
            onClear: mockOnClear,
            onSearchClick: mockOnSearchClick,
          ),
        ),
      ),
    );

    expect(find.byIcon(Icons.search), findsOneWidget);
    expect(find.byIcon(Icons.cancel_outlined), findsNothing);

    await tester.enterText(find.byType(TextField), 'test query');
    await tester.pump();

    expect(find.byIcon(Icons.cancel_outlined), findsOneWidget);

    await tester.testTextInput.receiveAction(TextInputAction.search);
    await tester.pump();

    await tester.tap(find.byIcon(Icons.cancel_outlined));
    await tester.pump();

    expect(find.byIcon(Icons.cancel_outlined), findsNothing);
    expect(find.text('test query'), findsNothing);
  });
}
