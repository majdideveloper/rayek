import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
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

void alertDialogDeletePost(BuildContext context, String message,
    {void Function()? onPressed}) {
  AlertDialog alert = AlertDialog(
    title: const Text("Alert", style: H3Style),
    content: Text(
      message,
      style: alertStyle,
    ),
    actions: [
      TextButton(
        child: Text("Cancel", style: H3Style),
        onPressed: () {
          // Do something when OK is pressed
          Navigator.of(context).pop();
        },
      ),
      TextButton(child: Text("OK", style: H3Style), onPressed: onPressed),
    ],
  );
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

void showLoadingDialog(BuildContext context, String url) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return WillPopScope(
        onWillPop: () async => false,
        child: AlertDialog(
            content: Container(
          child: Lottie.network(url, height: 250, width: 250),
        )),
      );
    },
  );
}
