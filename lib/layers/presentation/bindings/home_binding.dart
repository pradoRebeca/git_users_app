import 'package:get/get.dart';
import 'package:git_users_app/layers/presentation/controller/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() {
      return HomeController();
    });
  }
}
