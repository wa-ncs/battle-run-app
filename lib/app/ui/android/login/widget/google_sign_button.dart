import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:get/get.dart';
import 'package:how_much_spend_app/app/controller/login/login_controller.dart';

class GoogleSignButton extends GetView<LoginController> {
  const GoogleSignButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
      const EdgeInsets.symmetric(vertical: 5),
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 200),
        child: controller.isLoading
            ? Container(
          color: Colors.grey[200],
          height: 50,
          width: double.infinity,
        )
            : SizedBox(
          width: double.infinity,
          height: 50,
          child: SignInButton(
            Buttons.Google,
            onPressed: controller.signInWithGoogle,
          ),
        ),
      ),
    );
  }
}