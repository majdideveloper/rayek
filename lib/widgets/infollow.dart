import 'package:flutter/material.dart';
import 'package:rayek_v001/utils/utils.dart';

class InfollowButton extends StatelessWidget {
  final void Function() onPressed;

  InfollowButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          primary: BtColor,
          minimumSize: const Size(200, 55),
          side: const BorderSide(width: 1, color: BtColor),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
      onPressed: onPressed,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.favorite,
            color: BgColor,
          ),
          smallPaddingVer,
          Text('Infollow', style: lightStyle),
        ],
      ),
    );
  }
}
