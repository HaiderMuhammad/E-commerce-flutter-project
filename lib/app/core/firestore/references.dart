import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:real_e_commerce/app/core/firestore/collections.dart';
import 'package:real_e_commerce/app/core/model/cateory.dart';
import 'package:real_e_commerce/app/core/model/product.dart';



class References {

  final CollectionReference _userCollectionRef =
      FirebaseFirestore.instance.collection(Collections.auth);

  CollectionReference get userCollectionRef => _userCollectionRef;


  static final categories = FirebaseFirestore.instance
      .collection(Collections.categories).withConverter<CategoryModel>(
      fromFirestore: (x, _) => CategoryModel.fromJson(x.data()!),
      toFirestore: (x, _) => x.toJsonGetter
  );

  static final products = FirebaseFirestore.instance
      .collection(Collections.products).withConverter<ProductModel>(
      fromFirestore: (x, _) => ProductModel.fromJson(x.data()!),
      toFirestore: (x, _) => x.toJson
  );


}