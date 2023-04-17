import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../model/cart_product.dart';


class CartViewModel extends GetxController {

  final ValueNotifier<bool>  _loading = ValueNotifier(false);

  ValueNotifier<bool> get loading => _loading;

}
