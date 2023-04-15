import 'package:flutter/material.dart';


class CustomText {

  static Widget title({required String title, Color? color}) {
    return Text(
      title,
      style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 30,
          color: color ?? Colors.black
      ),
    );
  }


  static Widget subTitle({required String title, Color? color}) {
    return Text(
      title,
      style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 20,
          color: color ?? Colors.black
      ),
    );
  }


  static Widget headLine4({required String title, Color? color}) {
    return Text(
      title,
      style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 12,
          color: color ?? Colors.black
      ),
    );
  }

  static Widget headLine6({required String title, Color? color}) {
    return Text(
      title,
      style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 12,
          color: color ?? Colors.black
      ),
    );
  }

  static Widget headLine3({required String title, Color? color}) {
    return Text(
      title,
      style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18,
          color: color ?? Colors.black
      ),
    );
  }

}
