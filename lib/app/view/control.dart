import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_e_commerce/app/core/view_model/auth_vm.dart';
import 'package:real_e_commerce/app/view/auth/login.dart';
import 'package:real_e_commerce/app/view/home/home.dart';


class ControlView extends GetView<AuthViewModel> {
  const ControlView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() =>
        (controller.user != null)
            ? LoginPage()
            : LoginPage()
    );
  }
}
