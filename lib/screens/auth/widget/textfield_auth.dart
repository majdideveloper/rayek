import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class TextFieldAuth extends StatelessWidget {
  FocusNode passFocusNode;
  TextEditingController controller;
  String hintText;
  String? Function(String?)? validator;
  TextFieldAuth({
    Key? key,
    required this.passFocusNode,
    required this.controller,
    required this.hintText,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: TextInputAction.next,
      onEditingComplete: () =>
          FocusScope.of(context).requestFocus(passFocusNode),
      controller: controller,
      keyboardType: TextInputType.emailAddress,
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
