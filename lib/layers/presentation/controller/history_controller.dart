import 'package:git_users_app/layers/domain/models/dtos/history_dto.dart';
import 'package:git_users_app/layers/domain/models/dtos/search_dto.dart';

abstract class HistoryController {
  void call();

  void add(QuerySearchDto querySearchDto);

  void searchHistory(HistoryDto historyDto);
}
