import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:real_e_commerce/app/core/model/product.dart';
import 'package:real_e_commerce/app/core/view_model/home_vm.dart';
import '../../details_page/details.dart';



class ProductsList extends GetView<HomeViewModel> {
  ProductsList({Key? key, required this.list}) : super(key: key);
  RxList list;

  @override
  Widget build(BuildContext context) {
    return Obx(() => list.length.isGreaterThan(0)
        ? SizedBox(
            height: 220,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: list.length,
              itemBuilder: (context, index) {
                ProductModel product = list[index];

                return GestureDetector(
                  onTap: () {
                    Get.to(() => DetailsView(product: product));
                  },
                  child: Container(
                    height: 205,
                    width: 135,
                    padding: const EdgeInsets.only(left: 3, right: 3, top: 3),
                    margin: const EdgeInsets.only(right: 8, top: 10),
                    decoration: BoxDecoration(
                        border: Border.all(
                            width: 1.5, color: const Color(0xffF0F2F1)),
                        borderRadius: BorderRadius.circular(8)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(6.0),
                          child: Image.network(
                            product.image.toString(),
                            fit: BoxFit.cover,
                            height: 123,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 5, left: 6, right: 6, bottom: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    product.name.toString(),
                                    style: const TextStyle(
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                              FutureBuilder<dynamic>(
                                future: HomeViewModel.getCategoryByProduct(
                                  categoryId: product.categoryId.toString(),
                                ).timeout(const Duration(seconds: 5)),
                                builder: (context, snapshot) {
                                  if (snapshot.hasData &&
                                      snapshot.data != null &&
                                      snapshot.data!.isNotEmpty) {
                                    return SizedBox(
                                      height: 20,
                                      child: Text(snapshot.data!),
                                    );
                                  } else {
                                    return const Text(
                                        "Unknown"); // or any other default value
                                  }
                                },
                              ),
                              Text(
                                '${product.price} \$',
                                style: const TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        : const CupertinoActivityIndicator());
  }
}
