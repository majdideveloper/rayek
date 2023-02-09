import 'package:flutter/material.dart';
import 'package:rayek_v001/screens/auth/auth.dart';
import 'package:rayek_v001/utils/helper_method.dart';
import 'package:rayek_v001/widgets/logo_app.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            // widgetLogo
            Center(child: LogoApp()),
            ElevatedButton(
                onPressed: () {
                  goTo(context, const LoginScreen());
                },
                child: Text('data'))
          ],
        ),
      ),
    );
  }
}
