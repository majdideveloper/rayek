import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rayek_v001/utils/palette.dart';
import 'package:rayek_v001/utils/utils.dart';

class TextFieldAuth extends StatefulWidget {
  TextEditingController controller;
  Icon iconName;
  Icon? suffixIconName;
  String hintText;
  String? Function(String?)? validator;
  bool? isPassword;
  bool? viewSuffixPassword;
  TextFieldAuth({
    Key? key,
    required this.controller,
    required this.hintText,
    this.validator,
    this.isPassword = false,
    this.viewSuffixPassword = false,
    required this.iconName,
    this.suffixIconName,
  }) : super(key: key);

  @override
  State<TextFieldAuth> createState() => _TextFieldAuthState();
}

class _TextFieldAuthState extends State<TextFieldAuth> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
        textInputAction: TextInputAction.next,
        controller: widget.controller,
        keyboardType: TextInputType.emailAddress,
        obscureText: widget.isPassword!,
        validator: widget.validator,
        // validator: (value) {
        //   if (value!.isEmpty || !value.contains('@')) {
        //     return 'Please enter a valid email address';
        //   } else {
        //     return null;
        //   }
        // },

        style: const TextStyle(
          fontSize: 24,
          color: DarkText,
          fontWeight: FontWeight.w300,
        ),
        decoration: InputDecoration(
          focusColor: Colors.white,
          //add prefix icon
          prefixIcon: widget.iconName,
          suffixIcon: widget.viewSuffixPassword!
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      if (widget.isPassword! == false)
                        widget.isPassword = true;
                      else
                        widget.isPassword = false;
                    });
                  },
                  icon: FaIcon(
                    widget.isPassword!
                        ? FontAwesomeIcons.eye
                        : FontAwesomeIcons.eyeSlash,
                    size: 20,
                    color: BtColor,
                  ))
              : null,

          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),

          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: BtColor, width: 1.0),
            borderRadius: BorderRadius.circular(10.0),
          ),
          fillColor: Colors.grey,

          hintText: widget.hintText,

          //make hint text
          hintStyle: normalStyle,

          //create lable
          labelText: widget.hintText,
          //lable style
          labelStyle: const TextStyle(
            color: Colors.grey,
            fontSize: 16,
            fontFamily: "verdana_regular",
            fontWeight: FontWeight.w400,
          ),
        )

        // style: const TextStyle(color: Colors.black),
        // decoration: InputDecoration(
        //   hintText: hintText,
        //   hintStyle: const TextStyle(color: Colors.black),
        //   enabledBorder: const UnderlineInputBorder(
        //     borderSide: BorderSide(color: Colors.black),
        //   ),
        //   focusedBorder: const UnderlineInputBorder(
        //     borderSide: BorderSide(color: Colors.black),
        //   ),
        // ),

        );
  }
}


  // TextFormField(
  //                   textInputAction: TextInputAction.done,
  //                   onEditingComplete: () {
  //                     _submitFormOnLogin();
  //                   },
  //                   controller: _passTextController,
  //                   focusNode: _passFocusNode,
  //                   obscureText: _obscureText,
  //                   keyboardType: TextInputType.visiblePassword,
  //                   validator: (value) {
  //                     if (value!.isEmpty || value.length < 7) {
  //                       return 'Please enter a valid password';
  //                     } else {
  //                       return null;
  //                     }
  //                   },
  //                   style: const TextStyle(color: Colors.white),
  //                   decoration: InputDecoration(
  //                     suffixIcon: GestureDetector(
  //                         onTap: () {
  //                           setState(() {
  //                             _obscureText = !_obscureText;
  //                           });
  //                         },
  //                         child: Icon(
  //                           _obscureText
  //                               ? Icons.visibility
  //                               : Icons.visibility_off,
  //                           color: Colors.white,
  //                         )),
  //                     hintText: 'Password',
  //                     hintStyle: const TextStyle(color: Colors.white),
  //                     enabledBorder: const UnderlineInputBorder(
  //                       borderSide: BorderSide(color: Colors.white),
  //                     ),
  //                     focusedBorder: const UnderlineInputBorder(
  //                       borderSide: BorderSide(color: Colors.white),
  //                     ),
  //                   ),
  //                 ),

  