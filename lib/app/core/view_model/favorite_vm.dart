import 'package:get/get.dart';
import 'package:real_e_commerce/app/core/firestore/references.dart';
import '../model/favorite.dart';


class FavoriteViewModel extends GetxController {
  final RxList<FavoriteModel> _favoriteProducts = <FavoriteModel>[].obs;

  RxList<FavoriteModel> get favoriteProducts => _favoriteProducts;



  @override
  void onInit() {
    super.onInit();
    _getFavoriteProducts();
  }

  Future<void> _getFavoriteProducts() async{
    final List<FavoriteModel> list =[];

    await References.favorite.get().then((value) =>
        value.docs.map((doc) {
      list.add(doc.data());
        }
        ).toList()
    );

    _favoriteProducts.value = list;
  }
}