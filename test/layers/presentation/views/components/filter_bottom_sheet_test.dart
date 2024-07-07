import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:git_users_app/layers/domain/models/dtos/search_dto.dart';
import 'package:git_users_app/layers/presentation/views/components/filter_bottom_sheet.dart';

class MockCallback extends Mock {
  void call(dynamic querySearchDto);
}

void main() {
  testWidgets('FilterBottomSheet initializes controllers correctly',
      (WidgetTester tester) async {
    final querySearchDto = QuerySearchDto(
      location: 'New York',
      language: 'Dart',
      followers: '100',
      repositories: '50',
    );

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: FilterBottomSheet(
            querySearchDto: querySearchDto,
            onPressed: (_) {},
          ),
        ),
      ),
    );

    expect(find.text('New York'), findsOneWidget);
    expect(find.text('Dart'), findsOneWidget);
    expect(find.text('100'), findsOneWidget);
    expect(find.text('50'), findsOneWidget);
  });

  testWidgets('FilterBottomSheet applies filters correctly',
      (WidgetTester tester) async {
    final querySearchDto = QuerySearchDto(
      location: 'New York',
      language: 'Dart',
      followers: '100',
      repositories: '50',
    );

    final mockCallback = MockCallback();

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: FilterBottomSheet(
            querySearchDto: querySearchDto,
            onPressed: mockCallback,
          ),
        ),
      ),
    );

    await tester.enterText(find.byType(TextField).at(0), 'San Francisco');
    await tester.enterText(find.byType(TextField).at(1), 'Flutter');
    await tester.enterText(find.byType(TextField).at(2), '200');
    await tester.enterText(find.byType(TextField).at(3), '100');

    await tester.tap(find.text('Aplicar Filtro'));
    await tester.pumpAndSettle();

    final verificationResult = verify(mockCallback.call(captureAny));
    verificationResult.called(1);

    final captured = verificationResult.captured.first as QuerySearchDto;

    expect(captured.location, 'San Francisco');
    expect(captured.language, 'Flutter');
    expect(captured.followers, '200');
    expect(captured.repositories, '100');
  });
}
