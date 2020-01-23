import 'package:flutter/material.dart';
import 'package:login/authservice.dart';
import 'package:login/buttonwidget.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String userMail;
  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<AuthService>(context, listen: false);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Text(
            'infireads',
            style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
          ),
          Center(
            child: MainButton(
              buttonText: 'Sign In with Google',
              onpressed: () => user.signInWithGoogle(),
            ),
          ),
        ],
      ),
    );
  }
}
