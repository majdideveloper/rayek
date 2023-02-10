import 'package:flutter/material.dart';

class TextFieldAuth extends StatelessWidget {
  TextEditingController controller;
  String hintText;
  String? Function(String?)? validator;
  bool? isPassword;
  TextFieldAuth({
    Key? key,
    required this.controller,
    required this.hintText,
    this.validator,
    this.isPassword = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: TextInputAction.next,

      controller: controller,
      keyboardType: TextInputType.emailAddress,
      obscureText: isPassword!,

      validator: validator,
      // validator: (value) {
      //   if (value!.isEmpty || !value.contains('@')) {
      //     return 'Please enter a valid email address';
      //   } else {
      //     return null;
      //   }
      // },
      style: const TextStyle(color: Colors.black),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.black),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
      ),
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

  