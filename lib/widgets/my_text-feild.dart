import 'package:flutter/material.dart';

class MyTextfeild extends StatelessWidget {
   MyTextfeild({super.key, required this.lebeltext, required this.obsecured, required this.controller});

   final String lebeltext;
   final bool obsecured;
   final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return  TextField(
      controller: controller,
      obscureText:obsecured ,
        decoration: InputDecoration(
        labelText: lebeltext,

        border: OutlineInputBorder(


    ),
    ));
  }
}
