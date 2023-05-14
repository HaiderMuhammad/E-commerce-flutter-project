import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:real_e_commerce/app/global_widgets/custom_text.dart';
import 'package:real_e_commerce/app/view/home/widgets/category.dart';
import 'package:real_e_commerce/app/view/home/widgets/products.dart';
import 'package:real_e_commerce/app/view/home/widgets/search_view.dart';
import '../../global_widgets/custom_search_field.dart';


class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 100, right: 20, left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SearchField(
              onTap: ()=> Get.to(()=> const SearchView()),
            ),
            const SizedBox(height: 30,),
            CustomText.headLine3(title: 'Categories', color: Colors.black87),
            const SizedBox(height: 15,),
            CategoriesWidget(),
            // const SizedBox(
            //   height: 210,
            //   child: ProductsList(),
            // )
          ],
        ),
      ),
    );
  }
}
