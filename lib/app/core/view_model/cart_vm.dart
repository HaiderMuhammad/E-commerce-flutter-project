import 'dart:async';
import 'package:get/get.dart';
import 'package:real_e_commerce/app/core/data/firestore/references.dart';
import 'package:real_e_commerce/app/core/model/cart_product.dart';


class CartViewModel extends GetxController {
  final RxList<CartModel> _cartProducts = <CartModel>[].obs;
  RxList<CartModel> get cartProducts => _cartProducts;

  // final _cartStreamController = StreamController<RxList<CartModel>>.broadcast();
  // Stream<RxList<CartModel>> get cartStream => _cartStreamController.stream;

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
    update();
  }

  RxString getTotalPrice() {
    RxDouble total = 0.0.obs;

    _cartProducts.map((e) {
      double price = double.parse(e.price!.replaceAll(',','.'));
      total.value += (price * e.quantity.value).toDouble();
    }
    ).toString();

    return total.toStringAsFixed(2).obs;
  }

  RxString totalPriceOfProduct(CartModel product) {
    double price = double.parse(product.price!.replaceAll(',', '.'));
    RxDouble totalPrice = RxDouble(price * product.quantity.value);
    return totalPrice.value.toStringAsFixed(2).obs;
  }




// double price = double.parse(product.price!.replaceAll(',', '.'));
  // RxDouble totalPrice = RxDouble(price * product.quantity.value);
  // return totalPrice..value = double.parse(totalPrice.value.toStringAsFixed(2));


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
    // _cartStreamController.close();
    super.dispose();
  }
}


// Future<void> save() async {
//   References.account.doc(uid).set(this, SetOptions(merge: true));
// }
