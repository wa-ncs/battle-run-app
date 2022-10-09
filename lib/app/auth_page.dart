

import 'package:flutter/material.dart';
import 'package:how_much_spend_app/app/controller/login/login_controller.dart';
import 'package:how_much_spend_app/app/login_background.dart';
import 'package:get/get.dart';
import 'package:how_much_spend_app/app/routes/app_routes.dart';
class AuthPage extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Get.put(LoginController());
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
        body: GetBuilder<LoginController>(
          builder: (controller) {
            return Stack(
              alignment: Alignment.center,
              children: <Widget>[
                CustomPaint(
                  size:size,
                  painter: LoginBackground(isJoin: controller.isJoin),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    _logoImage,
                    Text("Battle Run",style: TextStyle(fontFamily: 'Aggro',fontSize: 35, fontWeight: FontWeight.bold, color: Colors.white)),
                    // Container(width:200, height: 200, color: Colors.blue,),
                     Stack(
                       alignment: Alignment.centerLeft,
                       children: <Widget>[
                         _inputForm(size, controller.isJoin),
                         _authButton(size, controller.isJoin),
                        // Container(width: 100, height: 50, color: Colors.black,),
                     ],),
                    Container(height: size.height*0.1,),
                    GestureDetector(
                      onTap: (){
                        controller.joinToggle();
                      },
                      child: Text(controller.isJoin ? "Already Have an Account? Sign in" : "Don't Have an Account? Create One",
                        style: TextStyle(color: controller.isJoin ? Colors.red : Colors.blue),)
                    ),
                    Container(height: size.height*0.05,)
                ],
              )
            ],
      );
          }
        ),
    );
  }

  Widget get _logoImage => const Expanded(
      child: Padding(
        padding: EdgeInsets.only(top:30, left:38, right:38),
        child: FittedBox(
          fit: BoxFit.contain,
          child: CircleAvatar(
              backgroundImage: AssetImage('assets/images/login.gif')
          ),
        ),
      )
  );

  Widget _authButton(Size size, bool isJoin) => Positioned(
      left: size.width*0.15,
      right: size.width*0.15,
      bottom: 0,
      child: SizedBox(
        height: 50,
        child: ElevatedButton(
          child: Text(
            isJoin ? "Join" : "Login",
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(isJoin ? Colors.red : Colors.blue),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(26.0),
                  )
              )
          ),
          onPressed: () {
            if(_formKey.currentState!.validate()) {
              print(_passwordController.text.toString());
              Get.toNamed(Routes.HOME);
            } else {

            }
          },
        ),
      ),
  );

  Widget _inputForm(Size size, bool isJoin) {
    return Padding(
      padding: EdgeInsets.all(size.width*0.05),
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16)
        ),
        elevation: 6,
        child: Padding(
          padding: const EdgeInsets.only(left:12, right: 12, top:12, bottom: 32),
          child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                        icon: Icon(Icons.account_circle),
                        labelText: "Email"
                    ),
                    validator: (String? value) {
                      if(value!.isEmpty) {
                        return "Please input correct Email.";
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    obscureText: true,
                    controller: _passwordController,
                    decoration: InputDecoration(
                        icon: Icon(Icons.vpn_key),
                        labelText: "Password"
                    ),
                    validator: (String? value) {
                      if(value!.isEmpty) {
                        return "Please input correct Password.";
                      }
                      return null;
                    },
                  ),
                  Container(height: 8,),
                  Opacity(
                    opacity: isJoin ? 0:1,
                      child: Text("Forgot Password", style:TextStyle(color: Colors.grey))
                  ),
                ],
              )),
        ),
      ),
    );
  }
}