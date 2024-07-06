import 'package:git_users_app/layers/data/datasources/history_datasource.dart';
import 'package:git_users_app/layers/domain/models/dtos/history_dto.dart';

class HistoryDatasourceImpl implements HistoryDatasource {
  List<HistoryDto> histories = [];

  @override
  List<HistoryDto> call() {
    return histories;
  }

  @override
  void add(HistoryDto historyDto) {
    histories.insert(0, historyDto);
  }
}
