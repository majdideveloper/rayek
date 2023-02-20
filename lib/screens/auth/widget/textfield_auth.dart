import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
        cursorColor: BtColor,
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
        ));
  }
}
