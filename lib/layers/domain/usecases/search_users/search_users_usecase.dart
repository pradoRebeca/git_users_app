import 'package:git_users_app/layers/domain/models/dtos/search_dto.dart';
import 'package:git_users_app/layers/shared/response_presentation.dart';

abstract class SearchUsersUsecase {
  Future<ResponsePresentation> call(QuerySearchDto query);
}
