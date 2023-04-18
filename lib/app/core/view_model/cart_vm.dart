import 'package:get/get.dart';
import 'package:real_e_commerce/app/core/firestore/references.dart';
import 'package:real_e_commerce/app/core/model/cart_product.dart';


class CartViewModel extends GetxController {
  final RxList<CartModel> _cartProducts = <CartModel>[].obs;
  RxList<CartModel> get cartProducts => _cartProducts;
  final List<CartModel> _list =[];
  Future get getCartProducts => _getCartProducts();



  @override
  void onInit() {
    super.onInit();
    _getCartProducts();
  }
  _getCartProducts() async{
    await References.cart.get().then((value) =>
        value.docs.map((doc) {
          _list.add(doc.data());
        }
        ).toList()
    );
    _cartProducts.value = _list;
  }

  updateList() {
    _cartProducts;
    update();
  }

}

// Future<void> save() async {
//   References.account.doc(uid).set(this, SetOptions(merge: true));
//   // await saveData(
//   //     data: toJson, path: 'appData/users', key: uid, useUid: false);
// }
