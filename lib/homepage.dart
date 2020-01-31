import 'package:flutter/material.dart';
import 'package:login/authservice.dart';
import 'package:login/buttonwidget.dart';
import 'package:login/profile.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String userName;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<AuthService>(context, listen: false);

    return Scaffold(
      backgroundColor: Color(0xFF8185E2),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            user.userName != null ? user.userName : 'No username found',
            style: TextStyle(fontSize: 25, color: Colors.white),
          ),
          SizedBox(height: 30),
          Text(
            user.userEmail != null ? user.userEmail : 'No usermail found',
            style: TextStyle(fontSize: 25, color: Colors.white),
          ),
          SizedBox(height: 30),
          Center(
            child: MainButton(
              buttonText: 'Log Out',
              onpressed: () => user.googleSignOut(),
            ),
          ),
        ],
      ),
    );
  }
}
