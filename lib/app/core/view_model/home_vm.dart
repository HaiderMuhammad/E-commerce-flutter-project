import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../firestore/references.dart';
import '../model/cateory.dart';



class HomeViewModel extends GetxController {

  final List<CategoryModel> _list = [];

  List<CategoryModel> get list => _list;

  HomeViewModel(){
    _getCategory();
  }

  _getCategory() async{
    References.categories.get()
        .then((value) => value.docs.map((e) {
      _list.add(e.data());
    }
    ).toList());
  }

  // static CategoryModel fromJson(Map json) {
  //   return CategoryModel.fromJson(json);
  // }

}