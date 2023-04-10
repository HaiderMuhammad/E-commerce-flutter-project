import 'package:flutter/material.dart';
import 'custom_text.dart';



class CustomButton1 extends StatelessWidget {
  const CustomButton1({Key? key,
    this.buttonColor,
    required this.onPressed,
    required this.label,
    this.labelColor
  }) : super(key: key);

  final String label;
  final Color? labelColor;
  final Color? buttonColor;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        onPressed: onPressed,
        height: 65,
        minWidth: double.infinity,
        color: buttonColor ?? const Color(0xff2D4980),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5)),
        child: CustomText.subTitle(title: label, color: labelColor ?? Colors.white)
    );
  }
}

