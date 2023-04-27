import 'package:flutter/material.dart';
import 'package:real_e_commerce/app/view/profile/profile_view.dart';


class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const ProfileView(),
    );
  }
}
