import 'package:flutter/material.dart';
import 'package:rayek_v001/utils/utils.dart';

void goTo(BuildContext context, Widget nextPage) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => nextPage));
}

void goToAndForget(BuildContext context, Widget nextPage) {
  Navigator.pushAndRemoveUntil(context,
      MaterialPageRoute(builder: (context) => nextPage), (route) => false);
}

void showSnackBar(BuildContext context, String text) {
  final snackBar = SnackBar(
      backgroundColor: BtColor,
      content: Text(
        text,
      ));
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
