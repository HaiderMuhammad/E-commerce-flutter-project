import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_e_commerce/app/core/view_model/home_vm.dart';


class SearchField extends GetView<HomeViewModel> {
  const SearchField({Key? key,this.onTap}) : super(key: key);
  final Function()? onTap;


  @override
  Widget build(BuildContext context) {
    return
      Container(
        color: Colors.grey.shade100,
        child: TextField(
          onChanged: controller.searchProduct,
          onTap: onTap,
          decoration: InputDecoration(
              hintText: 'Search for a product ...',
              hintStyle: const TextStyle(
                  fontSize: 15,
                  color: Colors.black45
              ),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 1,color: Colors.grey.shade300,
                      style: BorderStyle.solid),
                  borderRadius: BorderRadius.circular(5)
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(width: 1, color: Colors.blue),
                borderRadius: BorderRadius.circular(5),
              ),
              prefixIcon: const SizedBox(
                height: 20,
                width: 20,
                child: Icon(Icons.search_outlined)
              ),
              contentPadding: const EdgeInsets.only(top: 15,bottom: 15)
          ),
        ),
      );
  }
}