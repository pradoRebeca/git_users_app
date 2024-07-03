import 'package:get/get.dart';
import 'package:git_users_app/layers/data/repositories/search_users_repository_impl.dart';
import 'package:git_users_app/layers/domain/usecases/search_users_usecase_impl.dart';
import 'package:git_users_app/layers/external/datasource/search_users_datasource_impl.dart';
import 'package:git_users_app/layers/presentation/controller/search_controller.dart';
import 'package:git_users_app/layers/shared/http_client_adapter.dart';

class SearchUserBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SearchUserController>(() {
      final SearchUsersDatasourceImpl searchUsersDatasource =
          SearchUsersDatasourceImpl(HttpClientAdapter());

      final SearchUsersRepositoryImpl searchUsersRepository =
          SearchUsersRepositoryImpl(searchUsersDatasource);

      final SearchUsersUsecaseImpl searchUsersUsecase =
          SearchUsersUsecaseImpl(searchUsersRepository);

      return SearchUserController(searchUsersUsecase);
    });
  }
}
