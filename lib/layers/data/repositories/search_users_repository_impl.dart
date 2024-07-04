import 'package:git_users_app/layers/data/datasources/search_users_datasource.dart';
import 'package:git_users_app/layers/domain/models/dtos/search_dto.dart';
import 'package:git_users_app/layers/domain/models/dtos/user_dto.dart';
import 'package:git_users_app/layers/domain/repositories/search_users_repository.dart';

class SearchUsersRepositoryImpl implements SearchUsersRepository {
  SearchUsersRepositoryImpl(this._searchUsersDatasource);

  final SearchUsersDatasource _searchUsersDatasource;

  @override
  Future<List<UserDto>> call(QuerySearchDto query) async {
    try {
      var search = 'q=';

      if (query.query != null) {
        search += query.query!;
      }

      if (query.followers != null) {
        search += '+followers:${query.followers}';
      }

      if (query.repositories != null) {
        search += '+repos:${query.repositories}';
      }

      if (query.language != null) {
        search += '+language:${query.language}';
      }

      if (query.location != null) {
        search += '+location:${query.location}';
      }

      var response =
          await _searchUsersDatasource('/search/users?page=1&$search');

      final List<dynamic> data = response['items'];

      List<UserDto> listUsers = [];

      for (var user in data) {
        listUsers.add(UserDto.fromMap(user));
      }

      return listUsers;
    } catch (e) {
      print("teste error $e");

      throw Exception();
    }
  }
}
