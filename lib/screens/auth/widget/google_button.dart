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
          backgroundColor: BgColor,
          minimumSize: const Size(300, 55),
          side: const BorderSide(width: 1, color: BtColor),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
      onPressed: onPressed,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.network(
            'https://www.freepnglogos.com/uploads/google-logo-png/google-logo-png-webinar-optimizing-for-success-google-business-webinar-13.png',
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
