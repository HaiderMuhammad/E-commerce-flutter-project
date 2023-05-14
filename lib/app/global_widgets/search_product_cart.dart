import 'package:flutter/material.dart';
import 'Custom_text.dart';
import 'package:get/get.dart';

class ProductCart extends StatelessWidget {
  const ProductCart({Key? key,required this.productName,required this.productImage}) : super(key: key);
  final String productName;
  final String productImage;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GestureDetector(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(6.0),
            child: Image.network(
              productImage,
              fit: BoxFit.cover,
              height: 100,
              width: 100,
            ),
          ),
        ),
        const SizedBox(height: 5,),
        CustomText.headLine6(title: productName, color: const Color(0xff151921))
      ],
    );
  }
}