import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:rayek_v001/utils/utils.dart';

class FooterAuth extends StatelessWidget {
  final void Function() onTap;
  final String text;

  const FooterAuth({Key? key, required this.onTap, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
        text: TextSpan(
          text: 'Already Have Account? ',
          style: smallStyle,
          children: [
            TextSpan(
              text: 'Login',
              style: H2Style,
              recognizer: TapGestureRecognizer()..onTap = onTap,
            ),
          ],
        ),
      ),
    );
  }
}
