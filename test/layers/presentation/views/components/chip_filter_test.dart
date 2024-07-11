import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:git_users_app/layers/domain/models/dtos/search_dto.dart';
import 'package:git_users_app/layers/presentation/views/components/search_input.dart';

void main() {
  const String initialText = 'Initial text';
  const String textInsert = 'Text input';
  final iconCancelFinder = find.byIcon(Icons.cancel_outlined);
  final textFieldFinder = find.byType(TextField);

  bool onClearResult = false;
  bool onSearchClickResult = false;

  void onClear(QuerySearchDto querySearchDto) => onClearResult = true;

  void onSearchClick(QuerySearchDto querySearchDto) =>
      onSearchClickResult = true;

  Future<void> pumpSearchInputFull(WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: SearchInput(
          initialText: initialText,
          onClear: onClear,
          onSearchClick: onSearchClick,
        ),
      ),
    ));
  }

  Future<void> pumpSearchInputEmpty(WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: SearchInput(
          initialText: '',
          onClear: onClear,
          onSearchClick: onSearchClick,
        ),
      ),
    ));
  }

  testWidgets(
      'Search Input - Deverá aparecer uma input vazia com o icone de pesquisa',
      (WidgetTester tester) async {
    await pumpSearchInputEmpty(tester);

    final textField = tester.widget<TextField>(textFieldFinder);

    expect(find.byIcon(Icons.search), findsOneWidget);
    expect(textFieldFinder, findsOneWidget);
    expect(textField.controller?.text, '');
  });

  testWidgets(
    'Search Input - O TextInputAction deve ser do tipo pesquisa',
    (WidgetTester tester) async {
      await pumpSearchInputEmpty(tester);

      final textFieldWidget = tester.widget<TextField>(textFieldFinder);
      expect(textFieldWidget.textInputAction, TextInputAction.search);
    },
  );

  testWidgets('Search Input - Deverá aparecer o texto inicial no input',
      (WidgetTester tester) async {
    await pumpSearchInputFull(tester);

    expect(textFieldFinder, findsOneWidget);
    expect(find.text(initialText), findsOneWidget);
  });

  testWidgets(
      'Search Input - Deverá aparecer o icone de cancelar quando tiver um texto inicial no input',
      (WidgetTester tester) async {
    await pumpSearchInputFull(tester);

    expect(find.text(initialText), findsOneWidget);
    expect(iconCancelFinder, findsOneWidget);
  });

  testWidgets(
      'Search Input - Deverá aparecer o icone de cancelar ao escrever na input',
      (WidgetTester tester) async {
    await pumpSearchInputEmpty(tester);

    expect(iconCancelFinder, findsNothing);

    await tester.enterText(textFieldFinder, textInsert);
    await tester.pumpAndSettle();

    expect(find.text(textInsert), findsOneWidget);
    expect(find.byIcon(Icons.cancel_outlined), findsOneWidget);
  });

  testWidgets(
      'Search Input - Quando o icone de cancelar for clicado, não deverá aparecer o icone de cancelar',
      (WidgetTester tester) async {
    await pumpSearchInputFull(tester);

    expect(iconCancelFinder, findsOneWidget);

    await tester.tap(iconCancelFinder);
    await tester.pumpAndSettle();

    expect(iconCancelFinder, findsNothing);
  });

  testWidgets(
      'Search Input - Ao clicar no icone de cancelar o texto deverá ser apagado',
      (WidgetTester tester) async {
    await pumpSearchInputEmpty(tester);

    final textField = tester.widget<TextField>(textFieldFinder);

    await tester.enterText(textFieldFinder, textInsert);
    await tester.pumpAndSettle();

    expect(textField.controller?.text, textInsert);

    await tester.tap(iconCancelFinder);
    await tester.pumpAndSettle();

    expect(textField.controller?.text, '');
  });

  testWidgets(
      'Search Input - Ao clicar no icone de cancelar a função enviada deverá ser executada',
      (WidgetTester tester) async {
    await pumpSearchInputFull(tester);

    await tester.tap(iconCancelFinder);
    await tester.pumpAndSettle();

    expect(onClearResult, isTrue);
  });

  testWidgets(
      'Search Input - Ao clicar em no botão de pesquisa do teclado a função onSearchClick enviada, deverá ser executada',
      (WidgetTester tester) async {
    await pumpSearchInputEmpty(tester);

    onSearchClickResult = false;

    expect(onSearchClickResult, isFalse);

    final textField = tester.widget<TextField>(textFieldFinder);

    await tester.enterText(textFieldFinder, textInsert);
    await tester.testTextInput.receiveAction(TextInputAction.search);
    await tester.pumpAndSettle();

    expect(textField.controller?.text, textInsert);

    expect(onSearchClickResult, isTrue);
  });

  testWidgets(
      'Search Input - A medida que o input receber um texto, a função onSearchClick enviada, deverá ser executada',
      (WidgetTester tester) async {
    await pumpSearchInputEmpty(tester);

    onSearchClickResult = false;

    expect(onSearchClickResult, isFalse);

    final textField = tester.widget<TextField>(textFieldFinder);

    await tester.enterText(textFieldFinder, textInsert);
    await tester.testTextInput.receiveAction(TextInputAction.search);
    await tester.pumpAndSettle();

    expect(textField.controller?.text, textInsert);

    expect(onSearchClickResult, isTrue);
  });
}
