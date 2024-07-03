import 'package:git_users_app/layers/domain/repositories/search_users_repository.dart';
import 'package:git_users_app/layers/domain/usecases/search_users_usecase.dart';
import 'package:git_users_app/layers/shared/response_presentation.dart';

class SearchUsersUsecaseImpl implements SearchUsersUsecase {
  SearchUsersUsecaseImpl(this._searchUsersRepository);

  final SearchUsersRepository _searchUsersRepository;

  @override
  Future<ResponsePresentation> call(String search) async {
    try {
      var response = await _searchUsersRepository(search);
      return ResponsePresentation(success: true, body: response);
    } catch (error) {
      return ResponsePresentation(success: false, message: error.toString());
    }
  }
}
