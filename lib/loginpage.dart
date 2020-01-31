import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login/authservice.dart';
import 'package:login/buttonwidget.dart';
import 'package:provider/provider.dart';
import 'dart:async';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  String userMail;
  String email;
  String password;
  Color white = Colors.white;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<AuthService>(context, listen: false);
    return Scaffold(
      backgroundColor: Color(0xFF8185E2),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            TextAnimation(
              child: Text(
                'infireads',
                style: GoogleFonts.courgette(
                  textStyle: TextStyle(
                    color: white,
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              delay: 1000,
            ),
            Column(
              children: <Widget>[
                TextAnimation(
                  child: Text(
                    'Find nearby books.',
                    style: GoogleFonts.openSans(
                      textStyle: TextStyle(
                        color: white,
                        fontSize: 35,
                      ),
                    ),
                  ),
                  delay: 2000,
                ),
                TextAnimation(
                  child: Text(
                    'Anywhere, anytime!',
                    style: GoogleFonts.openSans(
                      textStyle: TextStyle(
                        color: white,
                        fontSize: 35,
                      ),
                    ),
                  ),
                  delay: 2500,
                ),
              ],
            ),
            TextAnimation(
              child: MainButton(
                buttonText: 'Sign In with Google',
                onpressed: () => user.signInWithGoogle(),
              ),
              delay: 3000,
            ),
          ],
        ),
      ),
    );
  }
}

class TextAnimation extends StatefulWidget {
  TextAnimation({this.child, this.delay});
  final Widget child;
  final int delay;
  @override
  _TextAnimationState createState() => _TextAnimationState();
}

class _TextAnimationState extends State<TextAnimation>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<Offset> offset;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 800));
    final curve = CurvedAnimation(curve: Curves.decelerate, parent: controller);
    offset = Tween<Offset>(begin: Offset(0.0, 0.35), end: Offset.zero)
        .animate(curve);

    if (widget.child == null) {
      controller.forward();
    } else {
      Timer(Duration(milliseconds: widget.delay), () {
        controller.forward();
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
        opacity: controller,
        child: SlideTransition(
          child: widget.child,
          position: offset,
        ));
  }
}
