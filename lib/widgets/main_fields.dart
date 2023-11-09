import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/constant.dart';



class TextFieldOne extends StatelessWidget {
  const TextFieldOne(
      {super.key, required this.hinttext, required this.controller, required this.onchange, required this.obsecuretxt, this.preicon, this.keytype, this.fillcolor, this.sufix, });

  final String hinttext;
  final TextEditingController controller;
  final ValueChanged onchange;
  final bool obsecuretxt;
  final IconData? preicon;
  final IconButton? sufix;
  final TextInputType? keytype;
  final Color? fillcolor;




  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: TextFormField(

        keyboardType: keytype,
        decoration: InputDecoration(
          suffixIcon: sufix,
          errorBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                width: 2,
                  color:app_color.withOpacity(.2)), // Border color when not in focus
            ),
            labelText: hinttext,
            labelStyle: GoogleFonts.poppins(color: Colors.grey.withOpacity(.8)),
            fillColor: fillcolor == null ? app_color.withOpacity(.05) : fillcolor,
            filled: true,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                width: 2,
                  color:app_color), // Border color when focused
            ),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(color: Colors.white)),

        ),
        style: TextStyle(color:Colors.white),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'This field is required.';
          }
          return null;
        },
        cursorColor: app_color,
        obscureText: obsecuretxt,
        obscuringCharacter: '*',
        controller: controller,
        onChanged: onchange,

      ),
    );
  }
}

