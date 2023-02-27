import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:rayek_v001/screens/auth/auth.dart';
import 'package:rayek_v001/utils/utils.dart';
import 'package:rayek_v001/widgets/custom_button.dart';
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
            smallPaddingHor,
            largePaddingHor,
            Center(child: LogoApp()),

            //Text welcome
            const Text('RAYEK Social Media', style: boldTitleStyle),
            meduimPaddingHor,
            const Text('Keep Calm Think and Pick', style: mediumStyle),

            // text account
            Center(
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: 'Already Have Account? ',
                  style: mediumStyle,
                  children: [
                    TextSpan(
                      text: 'Log\nin',
                      style: H2Style,
                      recognizer: TapGestureRecognizer()
                        ..onTap = () async {
                          goTo(context, const LoginScreen());
                        },
                    ),
                  ],
                ),
              ),
            ),
            largePaddingHor,

            //button signup
            CustomButton(
              onPressed: () async {
                goTo(context, const RegisterScreen());
              },
              text: 'Sign up with email',
            ),
            // ElevatedButton(
            //     onPressed: () async {
            //       goTo(context, const LoginScreen());
            //       // String resultat = await AuthMethods()
            //       //     .signUp("majdi@gmail.com", "123456", 'hana');
            //       // print(resultat);
            //     },
            //     child: Text('data')),
            smallPaddingHor,
            // button google
          ],
        ),
      ),
    );
  }
}
