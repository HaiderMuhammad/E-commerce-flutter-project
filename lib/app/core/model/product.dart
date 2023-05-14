import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/extenstion.dart';



class ProductModel {
  String? id, name, image, description, size, price, categoryId;
  Color? color;
  RxList<Color> productColors = <Color>[].obs;

  ProductModel({
    this.id,
    this.name,
    this.image,
    this.color,
    this.price,
    this.categoryId,
    this.description,
    this.size,
    List<Color>? productColors,
  }): productColors = RxList<Color>(productColors?? []);

  ProductModel.fromJson(Map<String, dynamic> json) {
    Color hexColor = HexColor.fromHex(json['color']);

    RxList<Color> colors = RxList<Color>(json['productColors']
        ?.map<Color>((c) => HexColor.fromHex(c)).toList() ?? []);

    id = json['id'];
    name = json['name'];
    size = json['size'];
    image = json['image'];
    color = hexColor;
    categoryId = json['categoryId'];
    description = json['description'];
    price = json['price'];
    productColors = colors;
  }

  static Map<String, dynamic> _toJson(ProductModel product) {
    return {
      'id': product.id,
      'name': product.name,
      'price': product.price,
      'size': product.size,
      'image': product.image,
      'color': product.color,
      'category': product.categoryId,
      'description': product.description,
      'productColors': product.productColors
    };
  }

  Map<String, dynamic> get toJson => _toJson(this);
}