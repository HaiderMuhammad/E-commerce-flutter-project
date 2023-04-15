import 'package:get/get.dart';
import 'package:real_e_commerce/app/core/model/product.dart';
import '../firestore/references.dart';
import '../model/cateory.dart';



class HomeViewModel extends GetxController {

  final List<CategoryModel> _categories = [];
  final List<ProductModel> _products = [];

  List<CategoryModel> get categories => _categories;
  List<ProductModel> get products => _products;

  HomeViewModel(){
    _getCategory();
    _getProducts();
  }

  _getCategory() async{
    References.categories.get()
        .then((value) => value.docs.map((e) {
      _categories.add(e.data());
    }
    ).toList());
  }

  _getProducts() async{
    References.products.get().then((value) =>
        value.docs.map((e) => _products.add(e.data())));
  }

}