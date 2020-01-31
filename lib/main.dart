import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login/authservice.dart';
import 'package:login/homepage.dart';
import 'package:login/loginpage.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  Widget checkUser() {
    return StreamBuilder<FirebaseUser>(
      stream: FirebaseAuth.instance.onAuthStateChanged,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          Provider.of<AuthService>(context).userName =
              snapshot.data.displayName;
          Provider.of<AuthService>(context).userEmail = snapshot.data.email;
          return HomePage();
        } else {
          return LoginPage();
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AuthService(),
      child: MaterialApp(
        title: 'Login Demo',
        debugShowCheckedModeBanner: false,
        home: checkUser(),
      ),
    );
  }
}
