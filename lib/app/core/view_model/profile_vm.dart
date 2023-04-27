import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:real_e_commerce/app/core/data/local_storage/LocalStorage.dart';
import 'package:real_e_commerce/app/core/model/user.dart';



class ProfileViewModel extends GetxController {

  final LocalStorage localStorage = Get.find();
  UserModel? _userModel;
  UserModel? get userModel => _userModel;

  @override
  void onInit() {
    super.onInit();
    getCurrentUser();
  }

  void getCurrentUser() async{
    await localStorage.getUser.then((value) {
      if(value != null) {
        _userModel = value;
      }
    });
    update();
  }

  Future<void> signOut() async{
    GoogleSignIn().signOut();
    FirebaseAuth.instance.signOut();
    // LocalStorage().removeUser;
    localStorage.removeUser;
  }
}