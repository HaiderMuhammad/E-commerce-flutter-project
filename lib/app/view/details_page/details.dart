import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_e_commerce/app/core/model/product.dart';
import 'package:real_e_commerce/app/view/details_page/product_color.dart';


class DetailsView extends StatelessWidget {
  final ProductModel? product;
  DetailsView({super.key, required this.product});



  final RxBool _isLike = false.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Text('Product Details',
            style: TextStyle(color: Colors.black87, fontWeight: FontWeight.w700),),
          leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(Icons.arrow_back_ios,color: Colors.black,),),
        ),
        body: Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: 250,
                child: Image.network(product!.image.toString(),
                  fit: BoxFit.fitWidth,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          product!.name.toString(),
                          style: const TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 15,
                              color: Colors.black87,
                              height: 2.5
                          ),
                        ),

                    Obx((){
                      return IconButton(
                        padding: const EdgeInsets.only(top: 25),
                        color: _isLike.value ? Colors.redAccent
                            : Colors.grey,
                        icon: const Icon(Icons.favorite_rounded, size: 25,),
                        onPressed: (){
                          _isLike.value = !_isLike.value;
                        },
                      );
                    }
                    ),
                      ],
                    ),
                  Text(
                    product!.price.toString(),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      color: Color(0xff67C4A7),
                    ),
                  ),
                    const SizedBox(height: 10,),
                    const Divider(height: 3, color: Colors.grey,),
                    const ProductColors(),
                    const Divider(height: 3, color: Colors.grey,),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Description of Product',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.black87,
                              height: 2.5
                          ),
                        ),
                        Text(
                          product!.description.toString(),
                          style: const TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 12,
                              color: Colors.black87,
                              height: 1.8
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10, top: 60),
                          child: MaterialButton(
                            onPressed: () {
                            },
                            height: 55,
                            minWidth: double.infinity,
                            color: const Color(0xff67C4A7),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)
                            ),
                            child: const Text("Add to Cart",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20
                                )
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ]
        )
    );
  }
}