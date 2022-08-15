import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:how_much_spend_app/app/bindings/login_binding.dart';
import 'package:how_much_spend_app/app/ui/android/login/login_page.dart';
import 'package:how_much_spend_app/app/ui/android/login/widget/profile.dart';

import 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(name: Routes.INITIAL, page: () => const LoginPage(), binding: LoginBinding()),
    GetPage(name: Routes.HOME, page: () => const ProfilePage()),
    // GetPage(
    //     name: Routes.HOME,
    //     page: () => Hom(),
    //     binding: DetailsBinding()),
  ];
}