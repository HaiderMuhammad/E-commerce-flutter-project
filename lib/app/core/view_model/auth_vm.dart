import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:real_e_commerce/app/core/data/local_storage/LocalStorage.dart';
import 'package:real_e_commerce/app/core/model/user.dart';
import 'package:real_e_commerce/app/view/control.dart';
import '../data/firestore/references.dart';


class AuthViewModel extends GetxController {
  final LocalStorage localStorage = Get.find();
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
    if(_auth.currentUser != null) {
      getCurrentUserData(_auth.currentUser!.uid);
    }
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
      Get.offAll(()=> const ControlView());
    }
    );
  }


  void signInWithEmail() async{
    try{
      await _auth.signInWithEmailAndPassword(email: email, password: password)
          .then((value) async{
            getCurrentUserData(value.user!.uid);
          });
      Get.offAll(()=> const ControlView());
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
    UserModel userModel = UserModel(
        uid: user.user?.uid,
        email: user.user?.email,
        name: user.user?.displayName ?? fullName,
        pic: user.user?.photoURL ?? '',
        type: Type.manager.name
    );
    await addUserToFireAuth(userModel);
    setUser(userModel);
  }

  void getCurrentUserData(String uid) async{
    await getCurrentUser(uid)
        .then((value) {
          if(value != null) {
            setUser(UserModel.fromJson(value.data()));
          }
    });
  }

  void setUser(UserModel userModel) async{
    await localStorage.setUser(userModel);
  }

  Future getCurrentUser(String uid) async{
    await References.user.doc(uid).get();
  }



}