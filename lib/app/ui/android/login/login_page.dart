import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:how_much_spend_app/app/ui/android/home/home_page.dart';
import 'package:how_much_spend_app/app/ui/android/home/index_page.dart';
import 'package:how_much_spend_app/app/ui/android/login/widget/google_sign_button.dart';
import 'package:how_much_spend_app/app/ui/android/login/widget/profile.dart';

class LoginPage extends StatelessWidget{
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraines) {
          return Row(
            children: [
              SizedBox(
                width: constraines.maxWidth >= 1200
                    ? constraines.maxWidth / 2
                    : constraines.maxWidth,
                child: StreamBuilder<User?>(
                  stream: FirebaseAuth.instance.authStateChanges(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return IndexPage(selectIndex: 0);
                    }
                    return const AuthGate();
                  },
                ),
              )
            ],
          );
        }
      ),
    );
  }
}

class AuthGate extends StatelessWidget {
  // ignore: public_member_api_docs
  const AuthGate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 300,
        ),
        const SizedBox(
            width: 270,
            child: GoogleSignButton()
        ),
        const SizedBox(
          height: 8,
        ),
        InkWell(
          child: Container(
            width: 200,
            height: 32,
            alignment: Alignment.center,
            child: const Text(
              '둘러보기',
              style: TextStyle(
                decoration: TextDecoration.underline,
              ),
            ),
          ),
          onTap: () => {Get.to(const IndexPage(selectIndex: 0))},
        )
      ],
    );
  }
}