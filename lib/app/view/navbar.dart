import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_e_commerce/app/view/auth/login.dart';
import 'package:real_e_commerce/app/view/auth/register.dart';
import 'package:real_e_commerce/app/view/cart/cart_page.dart';
import 'package:real_e_commerce/app/view/cart/cart_stream.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import '../core/view_model/navbar_vm.dart';
import 'favorite/favorite_view.dart';
import 'home/home.dart';




class NavBarView extends GetView<NavBarViewModel> {
  NavBarView({Key? key}) : super(key: key);


  final pages = [
    const HomePage(),
    const FavoriteView(),
    const CartPage(),
    RegisterPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return IndexedStack(
          index: controller.selectedIndex.value,
          children: pages,
        );
      }
      ),
      bottomNavigationBar: Obx(
              () {
            return SalomonBottomBar(
              currentIndex: controller.selectedIndex.value,
              onTap: (index) {
                controller.changeIndex(index);
              },
              items: [

                /// Home
                SalomonBottomBarItem(
                  icon: const Icon(Icons.home_outlined),
                  title: const Text("Home"),
                  selectedColor: const Color(0xff67C4A7),
                ),

                /// Likes
                SalomonBottomBarItem(
                  icon: const Icon(Icons.favorite_border),
                  title: const Text("Wishlist"),
                  selectedColor: const Color(0xff67C4A7),
                ),

                /// Search
                SalomonBottomBarItem(
                  icon: const Icon(Icons.shopping_cart_outlined),
                  title: const Text("Cart"),
                  selectedColor: const Color(0xff67C4A7),
                ),

                /// Profile
                SalomonBottomBarItem(
                  icon: const Icon(Icons.person_outline_rounded),
                  title: const Text("Profile"),
                  selectedColor: const Color(0xff67C4A7),
                ),
              ],
            );
          }
      ),
    );
  }
}