import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';


class AuthViewModel extends GetxController {
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late String email, password;



  void googleSignInMethod() async{
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    debugPrint('$googleUser');

    GoogleSignInAuthentication? googleSignInAuth = await googleUser?.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      idToken: googleSignInAuth?.idToken,
      accessToken: googleSignInAuth?.accessToken
    );

    await _auth.signInWithCredential(credential);
  }


  void signInWithEmail() async{
    try{
      await _auth.signInWithEmailAndPassword(email: email, password: password)
          .then((value) => debugPrint('$value'));
    }catch(e) {
      print(e);
    }
  }
}