import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_e_commerce/app/core/view_model/home_vm.dart';
import 'package:real_e_commerce/app/global_widgets/custom_text.dart';
import 'package:real_e_commerce/app/view/home/widgets/products.dart';

class CategoriesWidget extends GetView<HomeViewModel> {
  CategoriesWidget({Key? key}) : super(key: key);

  RxInt selectedIndex = 0.obs;

  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.categories.isNotEmpty
        ? Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 50,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: controller.categories.length,
            itemBuilder: (context, index) {
              var category = controller.categories[index];
              return GestureDetector(
                  onTap: () {
                    selectedIndex.value = index;
                  },
                  child: Obx(() => Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 10),
                        padding: const EdgeInsets.only(right: 10),
                        width: 110,
                        height: 50,
                        decoration: BoxDecoration(
                          color: selectedIndex.value == index
                              ? Colors.black
                              : Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border:
                          Border.all(width: 0.5, color: Colors.grey),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                                width: 38,
                                height: 45,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(
                                    child: Image.network(
                                      category.image.toString(),
                                      scale: 18,
                                      color: selectedIndex.value == index
                                          ? Colors.white
                                          : Colors.black87,
                                    ))),
                            const SizedBox(
                              width: 5,
                            ),
                            CustomText.headLine6(
                                title:
                                category.name!.capitalize.toString(),
                                color: selectedIndex.value == index
                                    ? Colors.white
                                    : Colors.black87)
                          ],
                        ),
                      ),
                    ],
                  )
                  )
              );
            },
          ),
        ),
        const SizedBox(height: 40,),
        // CustomText.headLine3(title: 'Best Selling', color: Colors.black87),
        if(selectedIndex.value == 0)
        ProductsList(list: controller.allProducts,),
        if(selectedIndex.value == 1)
          ProductsList(list: controller.gameProducts,),
        if(selectedIndex.value == 2)
          ProductsList(list: controller.watchProducts,),
      ],
    )
        : const CupertinoActivityIndicator());
  }
}
