import 'package:git_users_app/layers/data/datasources/search_users_datasource.dart';
import 'package:git_users_app/layers/domain/models/dtos/search_dto.dart';
import 'package:git_users_app/layers/domain/models/dtos/user_dto.dart';
import 'package:git_users_app/layers/domain/repositories/search_users_repository.dart';

class SearchUsersRepositoryImpl implements SearchUsersRepository {
  SearchUsersRepositoryImpl(this._searchUsersDatasource);

  final SearchUsersDatasource _searchUsersDatasource;

  @override
  Future<List<UserDto>> call(QuerySearchDto querySearchDto) async {
    try {
      final search = _buildSearchQuery(querySearchDto);

      var response =
          await _searchUsersDatasource('/search/users?page=1&$search');

      final List<dynamic> data = response['items'];

      return data.map((user) => UserDto.fromMap(user)).toList();
    } catch (e) {
      rethrow;
    }
  }

  String _buildSearchQuery(QuerySearchDto querySearchDto) {
    final buffer = StringBuffer('q=');

    if (querySearchDto.query?.isNotEmpty ?? false) {
      buffer.write(querySearchDto.query);
    }

    if (querySearchDto.language?.isNotEmpty ?? false) {
      buffer.write('+language:${querySearchDto.language}');
    }

    if (querySearchDto.location?.isNotEmpty ?? false) {
      buffer.write('+location:${querySearchDto.location}');
    }

    if (querySearchDto.followers?.isNotEmpty ?? false) {
      buffer.write('+followers:${querySearchDto.followers}');
    }

    if (querySearchDto.repositories?.isNotEmpty ?? false) {
      buffer.write('+repos:${querySearchDto.repositories}');
    }

    return buffer.toString();
  }
}
