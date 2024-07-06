import 'package:get/get.dart';
import 'package:git_users_app/layers/domain/models/dtos/search_dto.dart';
import 'package:git_users_app/layers/domain/models/dtos/user_dto.dart';
import 'package:git_users_app/layers/domain/usecases/search_users_usecase.dart';

class SearchUserController extends GetxController {
  SearchUserController(this._searchUsersUsecase);

  final SearchUsersUsecase _searchUsersUsecase;

  var isLoading = false.obs;
  var users = <UserDto>[].obs;
  var querySearch = QuerySearchDto().obs;

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

  void search(QuerySearchDto querySearch) {
    _updateQuerySearchDto(querySearch);
    getUsers();
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

    if (response.success) {
      users.assignAll(response.body as List<UserDto>);
    } else {
      users.clear();
    }

    isLoading.value = false;
  }
}
