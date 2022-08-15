import 'package:get/get.dart';
import 'package:how_much_spend_app/app/controller/login/login_controller.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() {
      return LoginController();
    });
  }
}