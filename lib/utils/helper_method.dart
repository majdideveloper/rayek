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

void alertDialog(BuildContext context, String message) {
  AlertDialog alert = AlertDialog(
    title: const Text("Alert", style: H3Style),
    content: Text(
      message,
      style: alertStyle,
    ),
    actions: [
      TextButton(
        child: Text("OK", style: H3Style),
        onPressed: () {
          // Do something when OK is pressed
          Navigator.of(context).pop();
        },
      ),
    ],
  );
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

void showLoadingDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return WillPopScope(
        onWillPop: () async => false,
        child: AlertDialog(
          content: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const <Widget>[
              CircularProgressIndicator(),
              Text("Loading..."),
            ],
          ),
        ),
      );
    },
  );
}
