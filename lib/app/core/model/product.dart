


import 'package:flutter/material.dart';

import '../../utils/extenstion.dart';

class ProductModel {
  String? id, name, image, description, size, price, categoryId;
  Color? color;

  ProductModel({
    this.id,
    this.name,
    this.image,
    this.color,
    this.price,
    this.categoryId,
    this.description,
    this.size
  });

  ProductModel.fromJson(Map<String, dynamic> json) {
    Color hexColor = HexColor.fromHex(json['color']);

    id = json['id'];
    name = json['name'];
    size = json['size'];
    image = json['image'];
    color = hexColor;
    categoryId = json['categoryId'];
    description = json['description'];
    price = json['price'];
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
    };
  }

  Map<String, dynamic> get toJson => _toJson(this);
}