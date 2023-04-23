// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:real_e_commerce/app/core/view_model/cart_vm.dart';
// import '../../core/model/cart_product.dart';
//
//
// class CartPage extends GetView<CartViewModel> {
//   const CartPage({Key? key}) : super(key: key);
//
//
//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<RxList<CartModel>>(
//       stream: controller.cartStream,
//       builder: (context, snapshot) {
//         if (snapshot.hasData) {
//           return ListView.builder(
//             itemCount: snapshot.data?.length,
//             itemBuilder: (context, index) {
//               return Text(snapshot.data![index].name.toString());
//             },
//           );
//         } else if (snapshot.hasError) {
//           return Text('Error occurred: ${snapshot.error}');
//         } else {
//           return const CircularProgressIndicator();
//         }
//       },
//     );
//   }
// }

