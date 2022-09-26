import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:how_much_spend_app/app/ui/theme/constant.dart';
import 'package:how_much_spend_app/app/ui/theme/utils.dart';

class HomePage extends StatefulWidget {
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{
  FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
        children: [
          Frame(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:[
                  LoginedText(name: _auth.currentUser?.displayName),
                  Row(children: [
                    IconButton(onPressed: (){}, icon: Icon(Icons.notifications_none)),
                    IconButton(onPressed: (){}, icon: Icon(Icons.settings))
                  ],)
                ]),
          ),
          SizedBox(
            height: 7,
          ),
          Divider(thickness: 7, color: Color(0xFFF2F2F2)),
          SizedBox(
            height: 7,
          ),
          Container(
            color: Colors.white,
            child: Frame(child: MainTitle(title: "오늘 활동")),
          ),
          SizedBox(height: 15),
          Frame(
            child: Container(
            decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            color: Color.fromRGBO(255, 184, 0, 0.1),
            ),
            constraints: BoxConstraints(
            minHeight: 150
            ),
            child: Column(
              children: [
                Padding(padding: const EdgeInsets.only(left: 20, right: 20, top:15),
                  child: Text(''),
                )
              ],
            )
            ),
          ),
        ],
    );
  }
}
class LoginedText extends StatelessWidget {
  final String? name;
  const LoginedText({required this.name});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text("${name}",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w500,
              height: 1.5,
              color: mainColor,
            )),
        Text(" 님,",
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w500,
                height: 1.5)),
      ],
    );
  }
}