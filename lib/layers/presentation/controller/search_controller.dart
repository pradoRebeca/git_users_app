import 'package:get/get.dart';
import 'package:git_users_app/layers/domain/models/dtos/search_dto.dart';
import 'package:git_users_app/layers/domain/models/dtos/user_dto.dart';
import 'package:git_users_app/layers/domain/usecases/search_users_usecase.dart';

class SearchUserController extends GetxController {
  SearchUserController(this._searchUsersUsecase);

  final SearchUsersUsecase _searchUsersUsecase;

  var isLoading = false.obs;

  var users = <UserDto>[].obs;

  var query = RxnString();
  var location = RxnString();
  var language = RxnString();
  var followers = RxnInt();
  var repositories = RxnInt();

  @override
  void onInit() {
    super.onInit();
    debounce(query, (String? query) {
      search(QuerySearchDto(query: query));
    }, time: const Duration(milliseconds: 500));
  }

  void search(QuerySearchDto querySearch) {
    if (querySearch.location != null) {
      location.value = querySearch.location!;
    }

    if (querySearch.language != null) {
      language.value = querySearch.language!;
    }

    if (querySearch.followers != null) {
      followers.value = querySearch.followers!;
    }

    if (querySearch.repositories != null) {
      repositories.value = querySearch.repositories!;
    }

    if (querySearch.query != null) {
      query.value = querySearch.query!;
    }

    getUsers();
  }

  Future<void> getUsers() async {
    isLoading.value = true;

    final QuerySearchDto querySearchDto = QuerySearchDto(
        location: location.value,
        language: language.value,
        followers: followers.value,
        query: query.value,
        repositories: repositories.value);

    var response = await _searchUsersUsecase(querySearchDto);

    if (!response.success) {
      return;
    }

    users.assignAll(response.body as List<UserDto>);

    isLoading.value = false;
  }
}
