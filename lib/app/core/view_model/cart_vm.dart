import 'dart:async';
import 'package:get/get.dart';
import 'package:real_e_commerce/app/core/firestore/references.dart';
import 'package:real_e_commerce/app/core/model/cart_product.dart';


class CartViewModel extends GetxController {
  final RxList<CartModel> _cartProducts = <CartModel>[].obs;
  RxList<CartModel> get cartProducts => _cartProducts;

  final _cartStreamController = StreamController<RxList<CartModel>>.broadcast();
  Stream<RxList<CartModel>> get cartStream => _cartStreamController.stream;

  @override
  void onInit() {
    super.onInit();
    _getCartProducts();
  }

  Future<void> _getCartProducts() async{
    final List<CartModel> list =[];
    await References.cart.get().then((value) =>
        value.docs.map((doc) {
          list.add(doc.data()); // use CartModel.fromJson(doc.data()) without withConverter func
        }
        ).toList()
    );
    _cartProducts.value = list;
    // debugPrint('New cart products: $_cartProducts');
    _cartStreamController.add(_cartProducts);
    update();
  }

  void addToCart(CartModel cartModel) {
    _cartProducts.add(cartModel);
    update(); // Notify listeners about the updated cart list
    cartModel.save();
  }

  void increase(RxInt quantity) {
    quantity.value++;
  }

  decrease(RxInt quantity) {
    quantity > 1
        ? quantity.value--
        : quantity.value = 1;
  }


  @override
  void dispose() {
    _cartStreamController.close();
    super.dispose();
  }
}


// Future<void> save() async {
//   References.account.doc(uid).set(this, SetOptions(merge: true));
// }
