import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_e_commerce/app/core/model/cart_product.dart';
import 'package:real_e_commerce/app/core/view_model/cart_vm.dart';
import 'package:real_e_commerce/app/global_widgets/custom_text.dart';
import '../../global_widgets/custom_button1.dart';



class CartView extends GetView<CartViewModel> {
  const CartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            Expanded(
                child: Obx(() => ListView.builder(
                    itemCount: controller.cartProducts.length,
                    itemBuilder: (context, index) {
                      var cartProduct = controller.cartProducts[index];
                      return Padding(
                          padding: const EdgeInsets.only(right: 15, top: 30, left: 15),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(6.0),
                                    child: Image.network(cartProduct.image.toString(),
                                      width: 80,
                                      height: 85,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              cartProduct.name.toString(),
                                              style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              margin: const EdgeInsets.only(top: 8),
                                              padding: const EdgeInsets.symmetric(horizontal: 5),
                                              width: 120,
                                              height: 36,
                                              decoration: BoxDecoration(
                                                  border: Border.all(width: 0.5, color: Colors.grey),
                                                  borderRadius: BorderRadius.circular(5)
                                              ),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Container(
                                                    padding: const EdgeInsets.only(right: 9),
                                                    height: 36,
                                                    decoration: const BoxDecoration(
                                                        border: Border(
                                                            right: BorderSide(width: 0.5, color: Colors.grey)
                                                        )
                                                    ),
                                                    child: GestureDetector(
                                                      onTap: () async{
                                                        controller.increase(cartProduct.quantity);
                                                        await CartModel().update(cartProduct);
                                                      },
                                                      child: const Icon(Icons.add),
                                                    ),
                                                  ),
                                                  Obx(() => CustomText.headLine5(
                                                      title: cartProduct.quantity.toString()
                                                  ),
                                                  ),
                                                  Container(
                                                    padding: const EdgeInsets.only(left: 9),
                                                    height: 36,
                                                    decoration: const BoxDecoration(
                                                        border: Border(
                                                            left: BorderSide(width: 0.5, color: Colors.grey)
                                                        )
                                                    ),
                                                    child: GestureDetector(
                                                      onTap: () async{
                                                        controller.decrease(cartProduct.quantity);
                                                        await CartModel().update(cartProduct);
                                                      },
                                                      child: const Icon(Icons.remove),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Text(
                                              '\$ ${cartProduct.price}',
                                              style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                                color: Color(0xff67C4A7),

                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )
                      );
                    }
                )
                )
            ),

            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 22),
                height: 100,
                width: double.infinity,
                decoration: const BoxDecoration(
                    border: Border(
                        top: BorderSide(
                            width: 0.5,
                            color: Colors.grey
                        )
                    )
                ),
                child: Row(
                  children: [
                    Column(
                      children: [
                        const SizedBox(height: 8,),
                        CustomText.headLine5(title: 'Total Price'),
                        CustomText.headLine3(title: '\$ 79,99'),
                      ],
                    ),
                    const SizedBox(width: 10,),
                    Expanded(child: CustomButton1(
                      onPressed: () {},
                      buttonColor: Colors.black87,
                      label: 'Checkout',
                    ),
                    )
                  ],
                ),
              ),
            ),
          ],
        )
    );
  }
}


