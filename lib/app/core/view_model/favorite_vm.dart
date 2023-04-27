import 'package:get/get.dart';
import 'package:real_e_commerce/app/core/model/product.dart';
import 'package:uuid/uuid.dart';
import '../data/firestore/references.dart';
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
        value.docs.map((doc) => list.add(doc.data())
        ).toList()
    );

    _favoriteProducts.value = list;
    update();
  }

  bool isProductLiked(ProductModel product) {
    return favoriteProducts.any((favoriteProduct) =>
    favoriteProduct.productId == product.id
    );
  }

  void addToFavorite(ProductModel product) async{
    final FavoriteModel favoriteModel = FavoriteModel(
        id: const Uuid().v4(),
        productId: product.id,
        image: product.image,
        name: product.name,
        price: product.price,
    );

    _favoriteProducts.add(favoriteModel);
    update();
    await favoriteModel.save();
  }

  void removeFromFavorite(String id) async{
    _favoriteProducts.removeWhere((favProduct) => favProduct.productId == id);
    update();
    await FavoriteModel(id: id).delete();
  }

}