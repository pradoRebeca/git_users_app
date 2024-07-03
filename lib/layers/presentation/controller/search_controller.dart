import 'package:get/get.dart';
import 'package:git_users_app/layers/domain/models/dtos/user_dto.dart';
import 'package:git_users_app/layers/domain/usecases/search_users_usecase.dart';

class SearchUserController extends GetxController {
  SearchUserController(this._searchUsersUsecase);

  final SearchUsersUsecase _searchUsersUsecase;

  var users = <UserDto>[].obs;

  Future<void> getUsers(String search) async {
    var response = await _searchUsersUsecase(search);

    if (!response.success) {
      print("error ${response.message}");

      return;
    }

    users.assignAll(response.body as List<UserDto>);
  }
}
