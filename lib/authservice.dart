import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService extends ChangeNotifier {
  FirebaseAuth auth = FirebaseAuth.instance;
  GoogleSignIn googleSignIn = GoogleSignIn();

  bool isSignedIn;
  String userName;
  String userEmail;

  signInWithGoogle() async {
    GoogleSignInAccount googleUser =
        await googleSignIn.signIn().catchError((onError) {});
    GoogleSignInAuthentication googleAuth = await googleUser.authentication;
    AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    AuthResult user = await auth.signInWithCredential(credential);
    notifyListeners();
  }

  signUp({email, password}) async {
    await auth.createUserWithEmailAndPassword(email: email, password: password);
  }

  googleSignOut() async {
    try {
      await auth.signOut();
      await googleSignIn.signOut();
    } catch (e) {}
  }
}
