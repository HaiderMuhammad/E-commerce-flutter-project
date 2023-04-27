// import 'package:get/get.dart';
// import 'package:uuid/uuid.dart';
// import '../model/favorite.dart';
// import '../model/product.dart';
// import 'favorite_vm.dart';
//
// class DetailsController extends GetxController {
//   final RxBool isLike = false.obs;
//
//   void toggleLike(ProductModel product) {
//     isLike.value = !isLike.value;
//     if (isLike.value) {
//       FavoriteViewModel favController = Get.find<FavoriteViewModel>();
//       FavoriteModel favoriteModel = FavoriteModel(
//         id: const Uuid().v4(),
//         productId: product.id,
//         image: product.image,
//         name: product.name,
//         price: product.price,
//       );
//
//       favController.addToFavorite(favoriteModel: favoriteModel);
//     }
//   }
// }