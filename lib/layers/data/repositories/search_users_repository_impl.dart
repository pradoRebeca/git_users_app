import 'package:git_users_app/layers/data/datasources/search_users_datasource.dart';
import 'package:git_users_app/layers/domain/models/dtos/user_dto.dart';
import 'package:git_users_app/layers/domain/repositories/search_users_repository.dart';

class SearchUsersRepositoryImpl implements SearchUsersRepository {
  SearchUsersRepositoryImpl(this._searchUsersDatasource);

  final SearchUsersDatasource _searchUsersDatasource;

  @override
  Future<List<UserDto>> call(String search) async {
    try {
      var response = await _searchUsersDatasource(search);

      List<Map<String, dynamic>> data = response['items'];

      List<UserDto> listUsers = [];

      for (var user in data) {
        listUsers.add(UserDto.fromMap(user));
      }

      return listUsers;
    } catch (e) {
      rethrow;
    }
  }
}
