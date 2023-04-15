import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:real_e_commerce/app/core/firestore/collections.dart';
import 'package:real_e_commerce/app/core/model/cateory.dart';
import 'package:real_e_commerce/app/core/model/product.dart';
import 'package:real_e_commerce/app/core/model/user.dart';



class References {
  final CollectionReference _userCollectionRef =
      FirebaseFirestore.instance.collection(Collections.auth);


  static final categories = FirebaseFirestore.instance
      .collection(Collections.categories).withConverter<CategoryModel>(
      fromFirestore: (x, _) => CategoryModel.fromJson(x.data()!),
      toFirestore: (x, _) => x.toJsonGetter
  );

  static final products = FirebaseFirestore.instance
      .collection(Collections.products).withConverter<ProductModel>(
      fromFirestore: (x, _) => ProductModel.fromJson(x.data()!),
      toFirestore: (x, _) => x.toJsonGetter
  );

  Future addUserToFireStore(UserModel userModel) async{
    return await _userCollectionRef.doc(userModel.uid)
        .set(userModel.toJson());
  }


}