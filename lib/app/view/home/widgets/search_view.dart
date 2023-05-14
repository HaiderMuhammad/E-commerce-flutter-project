import 'package:flutter/material.dart';
import 'package:real_e_commerce/app/core/view_model/home_vm.dart';
import 'package:real_e_commerce/app/global_widgets/empty_page.dart';
import '../../../global_widgets/custom_search_field.dart';
import '../../../global_widgets/search_product_cart.dart';
import 'package:get/get.dart';



class SearchView extends GetView<HomeViewModel> {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 35,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black, size: 23,),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            const SearchField(),
            const SizedBox(height: 30,),
            Obx(() => controller.isNull.value
                ? Center(child: EmptyCartPage(text: 'Search for anything',),)
                : SizedBox(
              height: 300,
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3, childAspectRatio: 0.7
                  ),
                  itemCount: controller.searchList.length,
                  itemBuilder: (context, index){
                    var productName = controller.searchList[index].name;
                    var productImage = controller.searchList[index].image;
                    return ProductCart(
                      productImage: productImage!,
                      productName: productName!,
                    );
                  }
              ),
            )
            )
          ],
        ),
      )
    );
  }
}
