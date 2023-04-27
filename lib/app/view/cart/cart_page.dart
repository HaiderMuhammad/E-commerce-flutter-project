import 'package:flutter/material.dart';
import 'package:real_e_commerce/app/view/cart/cart_view.dart';


class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CartView(),
    );
  }
}
