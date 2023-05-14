import 'package:flutter/material.dart';
import 'package:get/get.dart';

// class ColorPickerWidget extends StatefulWidget {
//   const ColorPickerWidget({super.key});
//
//   @override
//   _ColorPickerWidgetState createState() => _ColorPickerWidgetState();
// }
//
// class _ColorPickerWidgetState extends State<ColorPickerWidget> {
//   final List<Color> _colors = [    Colors.red,    Colors.blue,    Colors.green,    Colors.yellow,    Colors.purple,  ];
//   Color _selectedColor = Colors.red;
//
//   @override
//   Widget build(BuildContext context) {
//     return Wrap(
//       children: _colors
//           .map((color) => GestureDetector(
//         onTap: () {
//           setState(() {
//             _selectedColor = color;
//           });
//         },
//         child: Container(
//           width: 50,
//           height: 50,
//           decoration: BoxDecoration(
//             color: color,
//             border: Border.all(
//                 color: color == _selectedColor
//                     ? Colors.white
//                     : Colors.black,
//                 width: 2),
//             borderRadius: BorderRadius.circular(25),
//           ),
//         ),
//       )).toList(),
//     );
//   }
// }


class ProductColors extends StatelessWidget {
  ProductColors({Key? key, required this.colors}) : super(key: key);
  List<Color> colors;
  final Rx<Color> _selectedColor = const Color(0xffF5F5F5).obs;

  @override
  Widget build(BuildContext context) {
    return Obx(() => Wrap(
      children: colors
          .map((color) => GestureDetector(
        onTap: () {
          _selectedColor.value = color;
        },
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
          width: 75,
          height: 45,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: color == _selectedColor.value
                ? Icon(Icons.check,
              color: (color == const Color(0xff3E3D40))
                  ? Colors.white : Colors.black, size: 25,)
                : null
          ),
        ),
      )).toList(),
    ));
  }
}

