import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:how_much_spend_app/app/routes/app_pages.dart';
import 'package:how_much_spend_app/app/routes/app_routes.dart';
import 'package:how_much_spend_app/app/ui/theme/app_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: Routes.INITIAL,
      getPages: AppPages.pages,
      title: 'Battle Run',
      theme: appThemeData,
    );
  }
}