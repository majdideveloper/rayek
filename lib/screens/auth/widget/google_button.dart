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
    return

        // SignInButton(
        //   Buttons.Google,
        //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        //   text: text,
        //   onPressed: onPressed,
        // );

        ElevatedButton.icon(
      icon: Icon(Icons.g_mobiledata_rounded, color: BtColor),
      style: ElevatedButton.styleFrom(
          primary: BgColor,
          minimumSize: const Size(300, 55),
          side: const BorderSide(width: 1, color: BtColor),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
      onPressed: onPressed,
      label: Text(text, style: H5BtStyle),
    );
  }
}
