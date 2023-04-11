import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_e_commerce/app/core/view_model/auth_vm.dart';
import 'package:real_e_commerce/app/view/auth/login.dart';
import 'package:real_e_commerce/app/view/home/home.dart';
import '../../global_widgets/custom_button1.dart';
import '../../global_widgets/custom_button2.dart';
import '../../global_widgets/custom_text.dart';
import '../../global_widgets/custom_text_field.dart';
import '../../utils/validators.dart';



class RegisterPage extends GetWidget<AuthViewModel> {
  RegisterPage({Key? key}) : super(key: key);
  final GlobalKey<FormState> _registerKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black,),
          onPressed: () => Get.off(()=> LoginPage()),
        ),
        backgroundColor: Colors.white10,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Center(
          child: Form(
            key: _registerKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 100),
                    child: CustomText.title(title: 'Welcome')
                ),
                CustomTextField(
                  isFullName: true,
                  onChanged: (String value) {
                    controller.fullName = value;
                  }
                  ),
                CustomTextField(
                  isEmail: true,
                  onChanged: (String value) {
                    controller.email = value;
                  },
                  validator: Validators.email,
                ),
                CustomTextField(
                  isPassword: true,
                  onChanged: (String value) {
                    controller.password = value;
                  },
                  validator: Validators.password,
                ),
                Padding(
                    padding:
                    const EdgeInsets.only(left: 10, right: 10, top: 50),
                    child: CustomButton1(
                      onPressed: () {
                        _registerKey.currentState!.save();
                        if(_registerKey.currentState!.validate()) {
                          controller.createUserWithEmail();
                          Get.to(()=> const HomePage());
                        }
                      },
                      label: 'Sign Up',
                    )
                ),
                Padding(
                    padding:
                    const EdgeInsets.only(left: 10, right: 10, top: 30),
                    child: CustomButton2(
                      onPressed: () async{
                        controller.googleSignInMethod();
                      },
                      image: 'assets/images/google.png',
                      text: 'Login with Google',
                    )
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
