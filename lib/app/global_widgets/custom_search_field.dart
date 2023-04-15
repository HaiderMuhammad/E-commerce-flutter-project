import 'package:flutter/material.dart';


class SearchField extends StatelessWidget {
  const SearchField({Key? key, this.controller,}) : super(key: key);

  final TextEditingController? controller;


  @override
  Widget build(BuildContext context) {
    return
      Container(
        color: Colors.grey.shade100,
        child: TextField(
          controller: controller,
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
              prefixIcon: SizedBox(
                height: 20,
                width: 20,
                child: IconButton(
                    onPressed: (){},
                    padding: const EdgeInsets.all(0),
                    icon: const Icon(Icons.search_outlined)),
              ),
              contentPadding: const EdgeInsets.only(top: 15,bottom: 15)
          ),
        ),
      );
  }
}