import 'package:git_users_app/layers/data/datasources/search_users_datasource.dart';
import 'package:git_users_app/layers/domain/models/dtos/user_dto.dart';
import 'package:git_users_app/layers/domain/repositories/search_users_repository.dart';

class SearchUsersRepositoryImpl implements SearchUsersRepository {
  SearchUsersRepositoryImpl(this._searchUsersDatasource);

  final SearchUsersDatasource _searchUsersDatasource;

  @override
  Future<List<UserDto>> call(String search) async {
    try {
      var response =
          await _searchUsersDatasource('/search/users?page=1&q=$search');

      final List<dynamic> data = response['items'];

      List<UserDto> listUsers = [];

      for (var user in data) {
        listUsers.add(UserDto.fromMap(user));
      }

      // for (var user in data) {
      //   print("user ${user['login']}");

      //   UserDto userDto = await getUserDetails(user['login']);

      //   listUsers.add(userDto);
      // }

      return listUsers;
    } catch (e) {
      print("teste error $e");
      rethrow;
    }
  }

  // Future<UserDto> getUserDetails(String login) async {
  //   print("login ${login}");

  //   try {
  //     var response = await _searchUsersDatasource('/users/pradoRebeca');
  //     return UserDto.fromMap(response);
  //   } catch (e) {
  //     print("erro user ${e}");
  //     rethrow;
  //   }
  // }
}
