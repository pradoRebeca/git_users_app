import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:git_users_app/layers/domain/models/dtos/history_dto.dart';
import 'package:git_users_app/layers/presentation/views/components/history_card.dart';
import 'package:git_users_app/layers/shared/utils/datetime_formatter.dart';

void main() {
  testWidgets('HistoryCard displays history', (WidgetTester tester) async {
    // Arrange
    final historyDto = HistoryDto(
      history: 'Test History',
      dateTime: DateTime(2023, 7, 7, 12, 30),
    );

    // Act
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: HistoryCard(
            historyDto: historyDto,
          ),
        ),
      ),
    );

    // Assert
    expect(find.byIcon(Icons.history), findsOneWidget);
    expect(find.text('Test History'), findsOneWidget);
    expect(find.byIcon(Icons.north_west_rounded), findsOneWidget);
  });

  testWidgets('HistoryCard formatted date time', (WidgetTester tester) async {
    // Arrange
    final historyDto = HistoryDto(
      history: 'Test History',
      dateTime: DateTime(2023, 7, 7, 12, 30),
    );

    // Act
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: HistoryCard(
            historyDto: historyDto,
          ),
        ),
      ),
    );

    // Assert
    expect(find.text(DatetimeFormatter.formattedDateTime(historyDto.dateTime)),
        findsOneWidget);
  });
}
