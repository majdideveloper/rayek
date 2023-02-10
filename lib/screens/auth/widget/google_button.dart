import 'package:flutter/material.dart';
import 'package:rayek_v001/utils/utils.dart';

class GoogleButton extends StatelessWidget {
  final void Function() onPressed;
  String text;

  GoogleButton({
    Key? key,
    required this.onPressed,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          primary: BgColor,
          minimumSize: const Size(300, 55),
          side: const BorderSide(width: 1, color: BtColor),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
      onPressed: onPressed,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            "assets/images/google.png",
            height: 35,
            width: 35,
          ),
          smallPaddingVer,
          Text(
            text,
            style: boldTitleStyle,
          )
        ],
      ),
    );
  }
}
