import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_e_commerce/app/core/view_model/home_vm.dart';
import 'package:real_e_commerce/app/global_widgets/custom_text.dart';


class CategoriesWidget extends GetView<HomeViewModel> {
  const CategoriesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(
        builder: (controller) => SizedBox(
          height: 50,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: controller.categories.length,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.only(right: 10),
                padding: const EdgeInsets.only(right: 10),
                width: 110,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(width: 0.5, color: Colors.grey),
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
                              controller.categories[index].image.toString(),
                              scale: 18,
                              color: Colors.black87,
                            )
                        )),
                    const SizedBox(width: 5,),
                    CustomText.headLine6(title: controller.categories[index].name!.capitalize.toString())
                  ],
                ),
              );
            },
          ),
        )
    );
  }
}



