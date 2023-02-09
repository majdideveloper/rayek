import 'package:flutter/material.dart';
import 'package:rayek_v001/resources/auth_methods.dart';
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
                onPressed: () async {
                  goTo(context, const LoginScreen());
                  // String resultat = await AuthMethods()
                  //     .signUp("majdi@gmail.com", "123456", 'hana');
                  // print(resultat);
                },
                child: Text('data'))
          ],
        ),
      ),
    );
  }
}
