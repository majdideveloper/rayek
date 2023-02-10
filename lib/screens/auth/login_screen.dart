import 'package:flutter/material.dart';

import 'package:rayek_v001/screens/auth/auth.dart';
import 'package:rayek_v001/screens/auth/widget/form_text.dart';
import 'package:rayek_v001/screens/home/home_screen.dart';
import 'package:rayek_v001/utils/utils.dart';

import '../../resources/auth_methods.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/logo_app.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailTextController = TextEditingController();
  final _passTextController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool isLoading = false;

  @override
  void dispose() {
    _emailTextController.dispose();
    _passTextController.dispose();

    super.dispose();
  }

  void _submitFormOnLogin() {
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();
    if (isValid) {
      print('THe form is valid');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              // widgetLogo

              largePaddingHor,
              Center(child: LogoApp()),

              //Text welcome
              const Text('Welcome Back !!',
                  textAlign: TextAlign.center, style: normalStyle),
              const Text('Login',
                  textAlign: TextAlign.center, style: boldTitleStyle),

              // form Sign up
              Padding(
                padding: const EdgeInsets.all(40.0),
                child: Column(
                  children: [
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          smallPaddingHor,
                          TextFieldAuth(
                            iconName: Icon(
                              Icons.person_outline_rounded,
                              color: BtColor,
                            ),
                            controller: _emailTextController,
                            hintText: "email",
                          ),
                          smallPaddingHor,
                          //password form text
                          TextFieldAuth(
                            iconName: Icon(
                              Icons.lock_outline_rounded,
                              color: BtColor,
                            ),
                            controller: _passTextController,
                            hintText: "password",
                            isPassword: true,
                          ),
                          smallPaddingHor,
                        ],
                      ),
                    ),
                    // forget password
                    Align(
                      alignment: Alignment.topRight,
                      child: TextButton(
                          onPressed: () {
                            // goTo(context, RegisterScreen());
                            goTo(context, DemoClass());
                          },
                          child: const Text(
                            "Forget Passsword ?",
                            style: H2Style,
                          )),
                    ),
                  ],
                ),
              ),

              meduimPaddingHor,

              //button signup
              CustomButton(
                onPressed: () async {
                  setState(() {
                    isLoading = true;
                  });

                  String responce = await AuthMethods().logIn(
                      _emailTextController.text, _passTextController.text);

                  if (responce == 'succes') {
                    setState(() {
                      isLoading = false;
                    });

                    goTo(context, HomeScreen());
                  } else {
                    setState(() {
                      isLoading = false;
                    });
                  }
                },
                text: 'Log in',
                isLoading: isLoading,
              ),

              smallPaddingHor,
              FooterAuth(
                  onTap: () {
                    // goTo(context, RegisterScreen());
                    goTo(context, RegisterScreen());
                  },
                  text: 'Don\'t have Account ? ',
                  bttext: ' Sign Up')
              // button google
            ],
          ),
        ),
      ),
    );
  }
}
