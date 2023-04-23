import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import '../firestore/references.dart';



class CartModel {
  String? id, name, image, price, productId;
  RxInt quantity = 1.obs;

  CartModel({
    this.id,
    this.productId,
    this.name,
    this.image,
    this.price,
    int? quantity
  }) : quantity = RxInt(quantity!);


  CartModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    price = json['price'];
    quantity = RxInt(json['quantity']);
    productId = json['productId'];
  }

  static Map<String, dynamic> _toJson(CartModel cart) {
    return {
      'id': cart.id,
      'productId': cart.productId,
      'name': cart.name,
      'image': cart.image,
      'price': cart.price,
      'quantity': cart.quantity.value
    };
  }

  Map<String, dynamic> get toJson => _toJson(this);

  Future<void> save() async {
    await References.cart.doc(id).set(this, SetOptions(merge: true));
  }

  Future get saved => save();
}

