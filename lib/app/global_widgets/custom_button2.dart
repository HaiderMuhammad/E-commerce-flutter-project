import 'package:flutter/material.dart';

import 'custom_text.dart';



class CustomButton2 extends StatelessWidget {
  const CustomButton2({Key? key, required this.image, required this.text}) : super(key: key);
  final String image;
  final String text;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {},
      height: 65,
      minWidth: double.infinity,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
          side: const BorderSide(color: Colors.grey)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(right: 5),
            width: 28,
            height: 28,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(image))),
          ),
          CustomText.headLine4(title: text)
        ],
      ),
    );
  }
}
