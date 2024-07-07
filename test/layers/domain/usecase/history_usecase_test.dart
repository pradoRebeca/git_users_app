import 'package:flutter_test/flutter_test.dart';
import 'package:git_users_app/layers/data/datasources/history_datasource.dart';
import 'package:git_users_app/layers/data/repositories/history_repository_impl.dart';
import 'package:git_users_app/layers/domain/models/dtos/history_dto.dart';
import 'package:git_users_app/layers/domain/usecases/history/history_usecase_impl.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'history_usecase_test.mocks.dart';

@GenerateMocks([HistoryDatasource], customMocks: [MockSpec<List<HistoryDto>>()])
void main() {
  group('HistoryRepositoryImpl', () {
    late MockHistoryDatasource mockHistoryDatasource;
    late HistoryRepositoryImpl historyRepositoryImpl;
    late HistoryUsecaseImpl historyUsecaseImpl;

    setUp(() {
      mockHistoryDatasource = MockHistoryDatasource();
      historyRepositoryImpl = HistoryRepositoryImpl(mockHistoryDatasource);
      historyUsecaseImpl = HistoryUsecaseImpl(historyRepositoryImpl);
    });

    test('call() should call _historyDatasource()', () {
      // Setup
      final expectedHistory = [
        HistoryDto(dateTime: DateTime.now(), history: 'history test 1'),
        HistoryDto(dateTime: DateTime.now(), history: 'history test 2'),
      ];
      when(mockHistoryDatasource()).thenReturn(expectedHistory);

      var response = historyUsecaseImpl();

      expect(response.success, isTrue);
      expect(response.body, isA<List<HistoryDto>>());
    });

    test('call() should call _historyDatasource.add()', () {
      // Setup
      final expectedHistory =
          HistoryDto(dateTime: DateTime.now(), history: 'history test 1');

      historyUsecaseImpl.add(expectedHistory);

      verify(historyUsecaseImpl.add(expectedHistory)).called(1);
    });
  });
}
