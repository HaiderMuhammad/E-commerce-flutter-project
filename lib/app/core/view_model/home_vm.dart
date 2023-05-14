import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:real_e_commerce/app/core/model/product.dart';
import '../data/firestore/references.dart';
import '../model/cateory.dart';



class HomeViewModel extends GetxController {

  final RxList<CategoryModel> _categories = <CategoryModel>[].obs;
  final RxList<ProductModel> _allProducts = <ProductModel>[].obs;
  final RxList<ProductModel> _searchList = <ProductModel>[].obs;
  final RxList<ProductModel> _gameProducts = <ProductModel>[].obs;
  final RxList<ProductModel> _watchProducts = <ProductModel>[].obs;
  final FirebaseMessaging _fcm = FirebaseMessaging.instance;

  final RxBool isNull = true.obs;

  RxList<CategoryModel> get categories => _categories;
  RxList<ProductModel> get allProducts => _allProducts;
  RxList<ProductModel> get gameProducts => _gameProducts;
  RxList<ProductModel> get searchList => _searchList;
  RxList<ProductModel> get watchProducts => _watchProducts;

  @override
  void onInit() {
    super.onInit();
    _getCategory();
    _getAllProducts();
    _getGamesProducts();
    _getWatchProducts();
    _fcm.getToken().then((value) => debugPrint('the token is: $value'));
  }

  _getCategory() async{
    await References.categories.get().then((value) =>
        value.docs.map((e) {
      _categories.add(e.data());
    }
    ).toList());
  }

  _getAllProducts() async{
    await References.products.get().then((value) =>
        value.docs.map((e) {
          _allProducts.add(e.data());
        }
        ).toList()
    );
    update();
  }

  _getGamesProducts() async{
    await References.products.where('categoryId', isEqualTo: 'U7B5hse4GCAgsV9GVx2c')
        .get().then((value) => value.docs.map((e) {
          _gameProducts.add(e.data());
        }
    ).toList());
    update();
  }

  _getWatchProducts() async{

    // final products = await References.products.where('U7B5hse4GCAgsV9GVx2c').get();
    // final gameProducts = products.docs.map((e) => e.data()).toList();
    // final filter = gameProducts.where((e) => e.categoryId == 'U7B5hse4GCAgsV9GVx2c').toList();
    // _gameProducts.addAll(filter);
    // print(_gameProducts.length);
    // update();
    await References.products.where('categoryId', isEqualTo: 'OPuoVz6Pf9h5tXAAAU2R')
        .get().then((value) => value.docs.map((e) {
      _watchProducts.add(e.data());
    }
    ).toList());
    update();
  }

  static Future<String?> getByOrder({required String id}) async{
    var categoryQuery =  await References.categories.where('categoryId', isEqualTo: id).limit(1).get();
    if(categoryQuery.docs.isEmpty) {
      debugPrint('No data');
    }

    var getCategory = categoryQuery.docs.first.data().name;
    return getCategory;
  }

  void searchProduct(String productName) {
    if(productName.isNotEmpty) {
      List<ProductModel> result = _allProducts.where((product) =>
          product.name!.toLowerCase().contains(
              productName.toLowerCase())).toList();
      _searchList.value = result;
      update();
      isNull.value = false;
    } else{
      isNull.value = true;
      return;
    }
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