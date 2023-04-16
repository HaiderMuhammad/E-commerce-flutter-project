import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:real_e_commerce/app/core/model/product.dart';
import '../firestore/references.dart';
import '../model/cateory.dart';



class HomeViewModel extends GetxController {

  final List<CategoryModel> _categories = [];
  final List<ProductModel> _products = [];

  List<CategoryModel> get categories => _categories;
  List<ProductModel> get products => _products;

  @override
  void onInit() {
    super.onInit();
    _getCategory();
    _getProducts();
  }

  _getCategory() async{
    References.categories.get().then((value) =>
        value.docs.map((e) {
      _categories.add(e.data());
    }
    ).toList());
  }

  _getProducts() async{
    References.products.get().then((value) =>
        value.docs.map((e) {
          _products.add(e.data());
        }
        ).toList());
  }

  static Future<String?> getByOrder({required String id}) async{
    var categoryQuery =  await References.categories.where('categoryId', isEqualTo: id).limit(1).get();
    if(categoryQuery.docs.isEmpty) {
      print('non');
    }

    var getCategory = categoryQuery.docs.first.data().name;
    return getCategory;
}



  static Future<String?> getCategoryByProduct({required String categoryId}) async {
    try {
      final querySnapshot = await References.categories
          .where('categoryId', isEqualTo: categoryId).limit(1).get();

      if (querySnapshot.docs.isNotEmpty) {
        final categoryName = querySnapshot.docs.first.data().name;
        return categoryName;
      }
      return null;
    } catch (e) {
      debugPrint('Error fetching category by product: $e');
      return null;
    }
  }

}