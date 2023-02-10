import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:rayek_v001/utils/utils.dart';

class FooterAuth extends StatelessWidget {
  final void Function() onTap;
  final String text;
  final String bttext;
  const FooterAuth(
      {Key? key, required this.onTap, required this.text, required this.bttext})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
        text: TextSpan(
          text: text,
          style: normalStyle.copyWith(fontWeight: FontWeight.w800),
          children: [
            TextSpan(
              text: bttext,
              style: normalStyle.copyWith(
                  color: BtColor, fontWeight: FontWeight.w600),
              recognizer: TapGestureRecognizer()..onTap = onTap,
            ),
          ],
        ),
      ),
    );
  }
}
