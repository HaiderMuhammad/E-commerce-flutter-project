import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:real_e_commerce/app/core/model/user.dart';
import 'package:real_e_commerce/app/view/home/home.dart';
import '../firestore/references.dart';


class AuthViewModel extends GetxController {
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late String fullName, email, password;

  final _user = Rxn<User>();
  String? get user => _user.value?.email;


  @override
  void onInit() {
    super.onInit();
    _user.bindStream(_auth.authStateChanges()
        .where((user) => user != null).map((user) => user!).asBroadcastStream());
  }



  void googleSignInMethod() async{
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    debugPrint('$googleUser');

    GoogleSignInAuthentication? googleSignInAuth = await googleUser?.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      idToken: googleSignInAuth?.idToken,
      accessToken: googleSignInAuth?.accessToken
    );

    await _auth.signInWithCredential(credential)
        .then((user) async{
      saveUserInFireStore(user);
      Get.offAll(()=> const HomePage());
    }
    );
  }


  void signInWithEmail() async{
    try{
      await _auth.signInWithEmailAndPassword(email: email, password: password)
          .then((value) => debugPrint('$value'));
    }catch(e) {
      debugPrint('$e');
    }
  }

  void createUserWithEmail() async{
    try{
      await _auth.createUserWithEmailAndPassword(email: email, password: password)
          .then((user) async{
            saveUserInFireStore(user);
      });


    }catch(e) {
      debugPrint('$e');
    }
  }

  Future addUserToFireAuth(UserModel userModel) async{
    return await References().userCollectionRef.doc(userModel.uid)
        .set(userModel.toJson());
  }

  void saveUserInFireStore(UserCredential user) async{
    await addUserToFireAuth(
        UserModel(
            uid: user.user?.uid,
            email: user.user?.email,
            name: user.user?.displayName ?? fullName,
            pic: ''
        )
    );
  }
}