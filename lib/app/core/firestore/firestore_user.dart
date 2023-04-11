import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:real_e_commerce/app/core/firestore/collections.dart';
import 'package:real_e_commerce/app/core/model/user.dart';



class FireStoreUser {
  final CollectionReference _userCollectionRef =
      FirebaseFirestore.instance.collection(Collections.auth);

  Future addUserToFireStore(UserModel userModel) async{
    return await _userCollectionRef.doc(userModel.uid)
        .set(userModel.toJson());
  }
}