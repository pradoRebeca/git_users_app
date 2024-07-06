import 'package:git_users_app/layers/domain/models/dtos/history_dto.dart';
import 'package:git_users_app/layers/domain/repositories/history_repository.dart';
import 'package:git_users_app/layers/domain/usecases/history/history_usecase.dart';
import 'package:git_users_app/layers/shared/response_presentation.dart';

class HistoryUsecaseImpl extends HistoryUsecase {
  HistoryUsecaseImpl(this._historyRepository);

  final HistoryRepository _historyRepository;

  @override
  ResponsePresentation call() {
    final response = _historyRepository();

    return ResponsePresentation(success: true, body: response);
  }

  @override
  void add(HistoryDto historyDto) {
    _historyRepository.add(historyDto);
  }
}
