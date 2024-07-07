import 'package:git_users_app/layers/domain/models/dtos/history_dto.dart';
import 'package:git_users_app/layers/shared/response_presentation.dart';

abstract class HistoryUsecase {
  ResponsePresentation call();

  void add(HistoryDto historyDto);
}
