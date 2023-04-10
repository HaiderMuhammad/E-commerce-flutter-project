import 'package:get/get.dart';
import 'package:real_e_commerce/app/core/view_model/auth_vm.dart';


class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthViewModel());
  }

}