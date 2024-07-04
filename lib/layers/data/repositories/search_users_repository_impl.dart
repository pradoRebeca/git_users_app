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

      var data = response['items'];

      // List<String> loginProfiles = [];

      // for (var item in data) {
      //   print("login ${item['login']}");
      //   loginProfiles.add(item['login']);
      // }

      // var responses = await Future.wait(
      //     loginProfiles.map((login) => _searchUsersDatasource('/users/$login')));

      // List<UserDto> listUsers =
      //     responses.map((user) => UserDto.fromMap(user)).toList();

      List<UserDto> listUsers = [];

      for (var item in data) {
        listUsers.add(UserDto.fromMap(item));
      }

      return listUsers;
    } catch (e) {
      print("teste error $e");
      rethrow;
    }
  }
}
