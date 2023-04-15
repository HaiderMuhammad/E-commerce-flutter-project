import 'package:flutter/material.dart';


class ProductsList extends StatelessWidget {
  const ProductsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      itemCount: 3,
      itemBuilder: (context, index) {
        return GestureDetector(
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
                  child: Image.asset(
                    "assets/images/headset.jpg",
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
                        children: const [
                          Text(
                            'Headset',
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                      const Text(
                        '19,99 \$',
                        style: TextStyle(
                            fontSize: 12,
                            decoration: TextDecoration.lineThrough,
                            height: 2),
                      ),
                      const Text(
                        '14,99 \$',
                        style: TextStyle(
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
    );
  }
}
