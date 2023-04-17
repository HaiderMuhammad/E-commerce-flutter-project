import 'package:get/get.dart';
import 'package:real_e_commerce/app/core/view_model/auth_vm.dart';
import 'package:real_e_commerce/app/core/view_model/cart_vm.dart';
import 'package:real_e_commerce/app/core/view_model/home_vm.dart';
import 'package:real_e_commerce/app/core/view_model/navbar_vm.dart';


class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthViewModel());
    Get.lazyPut(() => NavBarViewModel());
    Get.lazyPut(() => HomeViewModel());
    Get.lazyPut(() => CartViewModel());
  }

}