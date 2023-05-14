import 'package:cloud_firestore/cloud_firestore.dart';

import '../data/firestore/references.dart';



class FavoriteModel {
  String? id, name, image, price, productId;

  FavoriteModel({
    this.id,
    this.name,
    this.productId,
    this.price,
    this.image
  });

  FavoriteModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['productId'];
    image = json['image'];
    name = json['name'];
    price = json['price'];
  }

  Map<String, dynamic> _toJson() {
    return {
      'id': id,
      'productId': productId,
      'name': name,
      'image': image,
      'price': price,
    };
  }

  Map<String, dynamic> get toJson => _toJson();

  Future<void> save() async {
    await References.favorite.doc(id).set(this, SetOptions(merge: true));
  }

  Future<void> delete(String id) async {
    await References.favorite.doc(id).delete();
  }


}