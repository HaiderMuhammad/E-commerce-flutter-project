import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../data/firestore/references.dart';



class CartModel {
  String? id, name, image, price, productId;
  RxInt quantity = 1.obs;

  CartModel({
    this.id,
    this.productId,
    this.name,
    this.image,
    this.price,
    int quantity = 1
  }) : quantity = RxInt(quantity);


  CartModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    price = json['price'];
    quantity = RxInt(json['quantity']);
    productId = json['productId'];
  }

  Map<String, dynamic> _toJson() {
    return {
      'id': id,
      'productId': productId,
      'name': name,
      'image': image,
      'price': price,
      'quantity': quantity.value
    };
  }

  Map<String, dynamic> get toJson => _toJson();

  Future<void> save() async {
    await References.cart.doc(id).set(this, SetOptions(merge: true));
  }

  Future<void> update(CartModel cartProduct) async {
    await References.cart.doc(cartProduct.id).update(cartProduct.toJson);
  }
}

