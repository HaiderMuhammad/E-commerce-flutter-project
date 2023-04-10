import 'package:flutter/material.dart';


class CustomTextField extends StatelessWidget {
  const CustomTextField({Key? key, required this.onChanged,
    this.isEmail, this.isPassword, this.validator
  }) : super(key: key);

  final Function(String) onChanged;
  final bool? isEmail;
  final bool? isPassword;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    if(isEmail ?? false) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 7),
        margin: const EdgeInsets.only(right: 10, left: 10, top: 25),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: const [
              BoxShadow(
                color: Color.fromRGBO(196,137,198,.1),
                blurRadius: 10,
                offset: Offset(0,.1),
              )
            ]
        ),
        child: TextFormField(
          keyboardType: TextInputType.emailAddress,
          onChanged: onChanged,
          textInputAction: TextInputAction.next,
          decoration: const InputDecoration(
            border: InputBorder.none,
            hintText: 'Email',
            hintStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.w400, color: Colors.grey),
          ),
          validator: validator
        )

    );
    }
    else if(isPassword ?? false) {
      return Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 7),
          margin: const EdgeInsets.only(right: 10, left: 10, top: 25),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: const [
                BoxShadow(
                  color: Color.fromRGBO(196,137,198,.1),
                  blurRadius: 10,
                  offset: Offset(0,.1),
                )
              ]
          ),
          child: TextFormField(
            keyboardType: TextInputType.emailAddress,
            onChanged: onChanged,
            textInputAction: TextInputAction.next,
            decoration: const InputDecoration(
              border: InputBorder.none,
              hintText: 'Password',
              hintStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.w400, color: Colors.grey),
            ),
            validator: validator
          )

      );
    }
    else{
      return Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 7),
          margin: const EdgeInsets.only(right: 10, left: 10, top: 25),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: const [
                BoxShadow(
                  color: Color.fromRGBO(196,137,198,.1),
                  blurRadius: 10,
                  offset: Offset(0,.1),
                )
              ]
          ),
          child: TextFormField(
            keyboardType: TextInputType.emailAddress,
            onChanged: onChanged,
            textInputAction: TextInputAction.next,
            decoration: const InputDecoration(
              border: InputBorder.none,
              hintText: 'hint',
              hintStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.w400, color: Colors.grey),
            ),
            validator: validator
          )

      );
    }
  }
}