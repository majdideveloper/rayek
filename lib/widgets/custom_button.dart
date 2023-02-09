import 'package:flutter/material.dart';
import 'package:rayek_v001/utils/utils.dart';

class CustomButton extends StatelessWidget {
  final void Function() onPressed;
  String text;

  CustomButton({
    Key? key,
    required this.onPressed,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          primary: BtColor,
          onPrimary: LighColor,
          minimumSize: const Size(300, 55),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
      onPressed: onPressed,
      child: Text(text, style: H4BtStyle),
    );
  }
}
