import 'dart:async';
import 'package:get/get.dart';
import 'package:real_e_commerce/app/core/data/firestore/references.dart';
import 'package:real_e_commerce/app/core/model/cart_product.dart';
import 'package:real_e_commerce/app/core/view_model/auth_vm.dart';


class CartViewModel extends GetxController {
  final RxList<CartModel> _cartProducts = <CartModel>[].obs;
  RxList<CartModel> get cartProducts => _cartProducts;

  final String currentUid = AuthViewModel().uid;

  final RxList<CartModel> _cartProduct = <CartModel>[].obs;
  RxList<CartModel> get cartProduct => _cartProduct;

  @override
  void onInit() {
    super.onInit();
    _getCart();
  }

  Future<void> _getCart() async{
    final List<CartModel> list =[];
    await References.cartUser.get().then((value) =>
        value.docs.map((doc) {
          list.add(doc.data());
        }).toList());
    _cartProduct.value = list;
    print('------${cartProduct.length}');
    update();
  }



  RxString getTotalPrice() {
    RxDouble total = 0.0.obs;

    _cartProduct.map((e) {
      double price = double.parse(e.price!.replaceAll(',','.'));
      total.value += (price * e.quantity.value);
    }
    ).toString();

    return total.toStringAsFixed(2).obs;
  }

  RxString totalPriceOfProduct(CartModel product) {
    double price = double.parse(product.price!.replaceAll(',', '.'));
    RxDouble totalPrice = RxDouble(price * product.quantity.value);
    return totalPrice.value.toStringAsFixed(2).obs;
  }

  void addToCart(CartModel cartModel) {
    _cartProduct.add(cartModel);
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

