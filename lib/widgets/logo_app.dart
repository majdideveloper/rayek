import 'package:flutter/material.dart';

class LogoApp extends StatelessWidget {
  double? size;
  LogoApp({
    Key? key,
    this.size = 200,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/logobg.png',
      height: size,
      width: size,
    );
  }
}
