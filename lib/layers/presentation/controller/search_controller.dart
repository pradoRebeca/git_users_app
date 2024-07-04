import 'package:get/get.dart';
import 'package:git_users_app/layers/domain/models/dtos/user_dto.dart';
import 'package:git_users_app/layers/domain/usecases/search_users_usecase.dart';

class SearchUserController extends GetxController {
  SearchUserController(this._searchUsersUsecase);
  final SearchUsersUsecase _searchUsersUsecase;

  var users = <UserDto>[].obs;
  var searchQuery = ''.obs;

  @override
  void onInit() {
    super.onInit();
    debounce(searchQuery, (String query) {
      if (query.isNotEmpty) {
        getUsers();
      }
    }, time: const Duration(milliseconds: 500));
  }

  void search(String search) {
    searchQuery.value = search;
  }

  Future<void> getUsers() async {
    var response = await _searchUsersUsecase(searchQuery.value);

    if (!response.success) {
      return;
    }

    users.assignAll(response.body as List<UserDto>);
  }
}
