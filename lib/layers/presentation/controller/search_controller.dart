import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_workers/utils/debouncer.dart';
import 'package:git_users_app/layers/domain/models/dtos/search_dto.dart';
import 'package:git_users_app/layers/domain/models/dtos/user_dto.dart';
import 'package:git_users_app/layers/domain/usecases/search_users/search_users_usecase.dart';
import 'package:git_users_app/layers/presentation/controller/history_controller.dart';

class SearchUserController extends GetxController {
  SearchUserController(this._searchUsersUsecase, this._historyController);

  final SearchUsersUsecase _searchUsersUsecase;
  final HistoryController _historyController;

  var isLoading = false.obs;
  var users = <UserDto>[].obs;
  var querySearch = QuerySearchDto().obs;

  final Debouncer _debouncer =
      Debouncer(delay: const Duration(milliseconds: 500));

  RxString parametroRota = RxString('');

  void goHistoryScreen() async {
    final hasHistory = await Get.toNamed('/history');

    if (hasHistory != null) {
      search(QuerySearchDto(query: hasHistory));
    }
  }

  void onClearFilter(QuerySearchDto querySearch) {
    _updateQuerySearchDto(QuerySearchDto(
      query: querySearch.query != null ? '' : null,
      location: querySearch.location != null ? '' : null,
      language: querySearch.language != null ? '' : null,
      followers: querySearch.followers != null ? '' : null,
      repositories: querySearch.repositories != null ? '' : null,
    ));
    getUsers();
  }

  void search(QuerySearchDto querySearchDto) {
    _updateQuerySearchDto(querySearchDto);
    print("teste 2 ${querySearch.value.query}");

    _debouncer.call(getUsers);
  }

  void _updateQuerySearchDto(QuerySearchDto querySearchDto) {
    querySearch.update((dto) {
      dto?.query = querySearchDto.query ?? dto.query;
      dto?.location = querySearchDto.location ?? dto.location;
      dto?.language = querySearchDto.language ?? dto.language;
      dto?.followers = querySearchDto.followers ?? dto.followers;
      dto?.repositories = querySearchDto.repositories ?? dto.repositories;
    });
  }

  Future<void> getUsers() async {
    isLoading.value = true;

    var response = await _searchUsersUsecase(querySearch.value);

    _historyController.add(querySearch.value);

    if (response.success) {
      users.assignAll(response.body as List<UserDto>);
    } else {
      users.clear();
    }

    isLoading.value = false;
  }
}
