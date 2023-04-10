import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_e_commerce/app/core/view_model/auth_vm.dart';
import '../../global_widgets/custom_button1.dart';
import '../../global_widgets/custom_button2.dart';
import '../../global_widgets/custom_text.dart';
import '../../global_widgets/custom_text_field.dart';
import '../../utils/validators.dart';



class LoginPage extends GetWidget<AuthViewModel> {
  LoginPage({Key? key}) : super(key: key);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 120, bottom: 100),
                  child: CustomText.title(title: 'Welcome back')
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
                        _formKey.currentState!.save();
                        if(_formKey.currentState!.validate()) {
                          controller.signInWithEmail();
                        }
                      },
                      label: 'Login',
                    )
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 0),
                      child: Row(
                        children: [
                          CustomText.headLine4(title: 'Don’t have an account?'),
                          TextButton(
                            onPressed: () {
                            },
                            child: CustomText.headLine4(
                                title: 'Sign up', color: const Color(0xff2D4990))
                          )
                        ],
                      ),
                    )
                  ],
                ),
                Padding(
                    padding:
                    const EdgeInsets.only(left: 10, right: 10, top: 30),
                    child: CustomButton2(
                      onPressed: () {
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
