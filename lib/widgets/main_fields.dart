
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/constant.dart';



class TextFieldOne extends StatefulWidget {
  const TextFieldOne(
      {super.key, required this.hinttext, required this.controller, required this.onchange, required this.obsecuretxt, this.preicon, this.keytype, this.fillcolor, this.sufix,  });

  final String hinttext;
  final TextEditingController controller;
  final ValueChanged onchange;
  final bool obsecuretxt;
  final IconData? preicon;
  final IconButton? sufix;
  final TextInputType? keytype;
  final Color? fillcolor;


  @override
  State<TextFieldOne> createState() => _TextFieldOneState();
}

class _TextFieldOneState extends State<TextFieldOne> {

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: TextFormField(
        keyboardType: widget.keytype,
        decoration: InputDecoration(
          suffixIcon: widget.sufix,
          errorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(width: 1, color: Colors.red),
          ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                width: 2,
                  color:app_color), // Border color when not in focus
            ),
            labelText: widget.hinttext,
            labelStyle: GoogleFonts.poppins(color: Colors.grey.withOpacity(.8)),
            fillColor: widget.fillcolor == null ? app_color.withOpacity(.05) : widget.fillcolor,
            filled: true,


            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                width: 2,
                  color:app_color), // Border color when focused
            ),

            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.white)),

        ),
        style: TextStyle(color:Colors.white,),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'This field is required.';
          }
          return null;
        },
        cursorColor: app_color,
        obscureText: widget.obsecuretxt,
        obscuringCharacter: '*',
        controller: widget.controller,
        onChanged: widget.onchange,

      ),
    );
  }
}

