import 'package:get/get.dart';
import 'package:git_users_app/layers/data/datasources/history_datasource.dart';
import 'package:git_users_app/layers/data/datasources/search_users_datasource.dart';
import 'package:git_users_app/layers/data/repositories/history_repository_impl.dart';
import 'package:git_users_app/layers/data/repositories/search_users_repository_impl.dart';
import 'package:git_users_app/layers/domain/repositories/history_repository.dart';
import 'package:git_users_app/layers/domain/repositories/search_users_repository.dart';
import 'package:git_users_app/layers/domain/usecases/history/history_usecase.dart';
import 'package:git_users_app/layers/domain/usecases/history/history_usecase_impl.dart';
import 'package:git_users_app/layers/domain/usecases/search_users/search_users_usecase.dart';
import 'package:git_users_app/layers/domain/usecases/search_users/search_users_usecase_impl.dart';
import 'package:git_users_app/layers/external/datasource/history_datasource_impl.dart';
import 'package:git_users_app/layers/external/datasource/search_users_datasource_impl.dart';
import 'package:git_users_app/layers/presentation/controller/history_controller.dart';
import 'package:git_users_app/layers/presentation/controller/history_controller_impl.dart';
import 'package:git_users_app/layers/presentation/controller/search_controller.dart';
import 'package:git_users_app/layers/shared/http_client_adapter.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    _bindHistory();
    _bindSearchUserController();
  }

  void _bindHistory() {
    Get.lazyPut<HistoryUsecase>(() => HistoryUsecaseImpl(Get.find()));
    Get.lazyPut<HistoryRepository>(() => HistoryRepositoryImpl(Get.find()));
    Get.lazyPut<HistoryDatasource>(() => HistoryDatasourceImpl());
    Get.put<HistoryControllerImpl>(
      HistoryControllerImpl(
        Get.find<HistoryUsecase>(),
      ),
    );

    Get.lazyPut<HistoryController>(
      () => Get.find<HistoryControllerImpl>(),
    );
  }

  void _bindSearchUserController() {
    Get.lazyPut<SearchUsersDatasource>(
      () => SearchUsersDatasourceImpl(HttpClientAdapter()),
    );
    Get.lazyPut<SearchUsersRepository>(
      () => SearchUsersRepositoryImpl(Get.find()),
    );
    Get.lazyPut<SearchUsersUsecase>(
      () => SearchUsersUsecaseImpl(Get.find()),
    );
    Get.lazyPut<SearchUserController>(
      () => SearchUserController(
        Get.find(),
        Get.find<
            HistoryController>(), // Aqui você acessa o HistoryController corretamente
      ),
    );
  }
}
