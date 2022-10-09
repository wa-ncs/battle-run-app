import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:how_much_spend_app/app/bindings/login_binding.dart';
import 'package:how_much_spend_app/app/ui/android/history/my_history_page.dart';
import 'package:how_much_spend_app/app/ui/android/home/index_page.dart';
import 'package:how_much_spend_app/app/ui/android/login/login_page.dart';
import 'package:how_much_spend_app/app/ui/android/login/widget/profile.dart';
import 'package:how_much_spend_app/app/auth_page.dart';
import 'package:how_much_spend_app/app/ui/android/record/record_detail_page.dart';

import 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(name: Routes.INITIAL, page: () => AuthPage(), binding: LoginBinding()),
    GetPage(name: Routes.HOME, page: () => const IndexPage(selectIndex: 0)),
    GetPage(name: Routes.RECORD_DETAIL, page: () => RecordDetailPage()),
    GetPage(name: Routes.MY_PAGE, page: () => MyHistoryPage()),
    // GetPage(
    //     name: Routes.HOME,
    //     page: () => Hom(),
    //     binding: DetailsBinding()),
  ];
}