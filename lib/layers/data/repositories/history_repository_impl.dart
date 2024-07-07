import 'package:git_users_app/layers/data/datasources/history_datasource.dart';
import 'package:git_users_app/layers/domain/models/dtos/history_dto.dart';
import 'package:git_users_app/layers/domain/repositories/history_repository.dart';

class HistoryRepositoryImpl implements HistoryRepository {
  HistoryRepositoryImpl(this._historyDatasource);

  final HistoryDatasource _historyDatasource;

  @override
  List<HistoryDto> call() {
    return _historyDatasource();
  }

  @override
  void add(HistoryDto historyDto) {
    _historyDatasource.add(historyDto);
  }
}
