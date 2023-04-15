import 'package:get/get.dart';

class NavBarViewModel extends GetxController {
  var selectedIndex = 0.obs;

  @override
  void onInit() {

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