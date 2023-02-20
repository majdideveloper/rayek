import 'package:flutter/material.dart';
import 'package:rayek_v001/utils/utils.dart';

class LogOutButton extends StatelessWidget {
  final void Function() onPressed;
  String text;
  Icon icon;

  LogOutButton({
    Key? key,
    required this.onPressed,
    required this.text,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          primary: BgColor,
          minimumSize: const Size(200, 55),
          side: const BorderSide(width: 1, color: BtColor),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
      onPressed: onPressed,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          icon,
          smallPaddingVer,
          Text(text, style: H3Style),
        ],
      ),
    );
  }
}
