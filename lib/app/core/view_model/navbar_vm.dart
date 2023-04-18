import 'package:get/get.dart';
import 'package:real_e_commerce/app/core/view_model/cart_vm.dart';


class NavBarViewModel extends GetxController {
  var selectedIndex = 0.obs;
  CartViewModel cartViewModel = Get.put(CartViewModel());


  @override
  void onInit() {
    cartViewModel.getCartProducts;
  }

  @override
  void onReady() {

  }

  @override
  void onClose() {

  }

  void changeIndex(int index){
    selectedIndex.value = index;
  }
}