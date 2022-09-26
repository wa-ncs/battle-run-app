

import 'package:flutter/material.dart';
import 'package:how_much_spend_app/app/login_background.dart';

class AuthPage extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
        body: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            CustomPaint(
              size:size,
              painter: LoginBackground(),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                _logoImage,
                Container(width:200, height: 200, color: Colors.blue,),
                 Stack(
                   alignment: Alignment.centerLeft,
                   children: <Widget>[
                     _inputForm(size),
                     _authButton(size),
                    // Container(width: 100, height: 50, color: Colors.black,),
                 ],),
                Container(height: size.height*0.1,),
                Text("Don't Have an Account? Create One"),
                Container(height: size.height*0.05,)
            ],
          )
        ],
      ),
    );
  }

  Widget get _logoImage => const Expanded(
      child: Padding(
        padding: EdgeInsets.only(top:40, left:24, right:24),
        child: FittedBox(
          fit: BoxFit.contain,
          child: CircleAvatar(
              backgroundImage: AssetImage('assets/login.gif')
          ),
        ),
      )
  );

  Widget _authButton(Size size) => Positioned(
      left: size.width*0.15,
      right: size.width*0.15,
      bottom: 0,
      child: SizedBox(
        height: 50,
        child: ElevatedButton(
          child: Text("Login", style: TextStyle(fontSize: 20, color: Colors.white),),
          onPressed: () {
            if(_formKey.currentState!.validate()) {
              print(_passwordController.text.toString());
            }
          },
        ),
      ),
  );

  Widget _inputForm(Size size) {
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
                  Text("Forgot Password"),
                ],
              )),
        ),
      ),
    );
  }
}