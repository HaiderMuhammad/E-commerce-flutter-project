import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_e_commerce/app/core/view_model/profile_vm.dart';
import '../../global_widgets/custom_text.dart';
import '../auth/login.dart';


class ProfileView extends GetView<ProfileViewModel> {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 20, right: 20, bottom: 20),
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.black87,
                  image: controller.userModel?.pic != null
                      ? DecorationImage(
                    image: NetworkImage(controller.userModel!.pic.toString()),
                    fit: BoxFit.cover,)
                      : const DecorationImage(
                    image: AssetImage('assets/images/person.jpg'),
                    fit: BoxFit.cover,
                  ),

                ),
              ),
              Column(
                children: [
                  CustomText.subTitle(title: 'Haider Muhammad'),
                  const SizedBox(height: 5,),
                  CustomText.headLine6(title: 'haidermuhammadk99@gmail.com'),
                ],
              )
            ],
          ),
          SizedBox(
            width: 100,
            height: 60,
            child: Center(
              child: FloatingActionButton(
                onPressed: () {
                  controller.signOut();
                  Get.offAll(()=> LoginPage());
                },
                child: const Text('SignOut'),
              ),
            ),
          )
      ],
    ),
    );
  }
}

// SizedBox(height: 50,),
// Expanded(child: ListView.builder(
// itemCount: 5,
// itemBuilder: (context, index) {
// return Column(
// children: [
// Row(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// children: [
// Row(
// children: [
// Icon(Icons.edit),
// SizedBox(width: 15,),
// CustomText.headLine5(title: 'Edit Profile'),
// ],
// ),
// Icon(Icons.arrow_forward_ios_rounded),
// ],
// ),
// SizedBox(height: 30,)
// ],
// );
// },
// ),
