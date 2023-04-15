import 'package:flutter/material.dart';
import 'package:real_e_commerce/app/global_widgets/custom_text.dart';
import 'package:real_e_commerce/app/view/home/widgets/category.dart';
import 'package:real_e_commerce/app/view/home/widgets/products.dart';
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
            const SearchField(),
            const SizedBox(height: 30,),
            CustomText.headLine3(title: 'Categories', color: Colors.black87),
            const SizedBox(height: 15,),
            const CategoriesWidget(),
            const SizedBox(height: 40,),
            CustomText.headLine3(title: 'Best Selling', color: Colors.black87),
            const SizedBox(
              height: 210,
              child: ProductsList(),
            )
          ],
        ),
      ),
    );
  }
}
