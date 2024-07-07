import 'package:git_users_app/layers/domain/models/dtos/history_dto.dart';

abstract class HistoryRepository {
  List<HistoryDto> call();

  void add(HistoryDto historyDto);
}
