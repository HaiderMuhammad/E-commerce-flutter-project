import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_e_commerce/app/core/view_model/favorite_vm.dart';


class FavoriteView extends GetView<FavoriteViewModel> {
  const FavoriteView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Obx(() => ListView.builder(
          itemCount: controller.favoriteProducts.length,
          itemBuilder: (context, index) {
            var favProduct = controller.favoriteProducts[index];
            return Padding(
                padding: const EdgeInsets.only(right: 15, top: 30, left: 15),
                child: Column(
                  children: [
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(6.0),
                          child: Image.network(favProduct.image.toString(),
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
                              Text(
                                favProduct.name.toString(),
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 10,),
                              Text(
                                '\$ ${favProduct.price}',
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff67C4A7),

                                ),
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
    );
  }
}
