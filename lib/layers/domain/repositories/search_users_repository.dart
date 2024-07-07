import 'package:git_users_app/layers/domain/models/dtos/search_dto.dart';
import 'package:git_users_app/layers/domain/models/dtos/user_dto.dart';

abstract class SearchUsersRepository {
  Future<List<UserDto>> call(QuerySearchDto search);
}
