import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class EmptyCartPage extends StatelessWidget {
  EmptyCartPage({Key? key, required this.text, this.icon}) : super(key: key);
  String text;
  IconData? icon;

  @override
  Widget build(BuildContext context) {
    return  Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: Colors.black26, size: 50,),
        Text(
          text,
          style: GoogleFonts.roboto(color: Colors.black, fontSize: 20, height: 2),
        )
      ],
    );
  }
}