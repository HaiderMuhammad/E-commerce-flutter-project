import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_e_commerce/app/core/model/cart_product.dart';
import 'package:real_e_commerce/app/core/model/product.dart';
import 'package:real_e_commerce/app/core/view_model/favorite_vm.dart';
import 'package:real_e_commerce/app/view/details_page/product_color.dart';
import 'package:uuid/uuid.dart';
import '../../core/view_model/cart_vm.dart';


class DetailsView extends GetView<FavoriteViewModel> {
  final ProductModel? product;

  const DetailsView({super.key, required this.product});

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
        body: GetBuilder<FavoriteViewModel>(
          init: FavoriteViewModel(),
          builder: (favController) {
            // find the favorite status of the product
            RxBool isFavorite = favController.isProductLiked(product!).obs;
            return Column(
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
                            Obx(() => IconButton(
                              padding: const EdgeInsets.only(top: 25),
                              color: isFavorite.value
                                  ? Colors.redAccent
                                  : Colors.grey,
                              icon: const Icon(Icons.favorite_rounded, size: 25,),
                              onPressed: (){
                                if(isFavorite.value) {
                                  isFavorite.value = !isFavorite.value;
                                  favController.removeFromFavorite(product!.id.toString());
                                }
                                else{
                                  isFavorite.value = !isFavorite.value;
                                  favController.addToFavorite(product!);
                                }
                              },
                            ))
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
                                  CartViewModel cartViewModel = Get.find<CartViewModel>();

                                  bool alreadyInCart = cartViewModel
                                      .cartProducts.any((cartProduct) =>
                                  cartProduct.productId == product!.id
                                  );

                                  if (alreadyInCart) {
                                    return;
                                  }
                                  CartModel cartModel = CartModel(
                                      id: const Uuid().v4(),
                                      productId: product!.id,
                                      name: product!.name,
                                      price: product!.price,
                                      image: product!.image,
                                      quantity: 1
                                  );
                                  cartViewModel.addToCart(cartModel);
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
            );
          },
        )
    );
  }
}


