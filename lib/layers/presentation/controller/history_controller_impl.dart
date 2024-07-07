import 'package:get/get.dart';
import 'package:git_users_app/layers/domain/models/dtos/history_dto.dart';
import 'package:git_users_app/layers/domain/models/dtos/search_dto.dart';
import 'package:git_users_app/layers/domain/usecases/history/history_usecase.dart';
import 'package:git_users_app/layers/presentation/controller/history_controller.dart';

class HistoryControllerImpl extends GetxController
    implements HistoryController {
  HistoryControllerImpl(this._historyUsecase);

  final HistoryUsecase _historyUsecase;
  var histories = <HistoryDto>[].obs;

  @override
  void onInit() {
    super.onInit();

    call();
  }

  @override
  void add(QuerySearchDto querySearchDto) {
    String? query = querySearchDto.query;

    if (query != null && query.isNotEmpty) {
      _historyUsecase.add(HistoryDto(history: query, dateTime: DateTime.now()));

      call();
    }
  }

  @override
  void call() {
    final response = _historyUsecase();

    histories.assignAll(response.body as List<HistoryDto>);
  }
}
