import 'package:flutter/material.dart';
import 'package:rayek_v001/resources/auth_methods.dart';

import 'package:rayek_v001/screens/auth/auth.dart';
import 'package:rayek_v001/screens/auth/widget/widget_auth.dart';

import '../../utils/utils.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/logo_app.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _userNameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordConformationController = TextEditingController();

  bool isLaoding = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              // widgetLogo
              smallPaddingHor,
              largePaddingHor,
              Center(child: LogoApp()),

              //Text welcome
              const Text('Create Account\n with email',
                  textAlign: TextAlign.center, style: boldTitleStyle),
              // form Sign up
              Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFieldAuth(
                        controller: _userNameController,
                        hintText: "UserName",
                      ),
                      smallPaddingHor,
                      TextFieldAuth(
                        controller: _emailController,
                        hintText: "email",
                      ),
                      smallPaddingHor,
                      TextFieldAuth(
                        controller: _passwordController,
                        hintText: "password",
                        isPassword: true,
                      ),
                      smallPaddingHor,
                      TextFieldAuth(
                        controller: _passwordConformationController,
                        hintText: "password Coniformation",
                        isPassword: true,
                      ),
                      smallPaddingHor,
                    ],
                  )),

              meduimPaddingHor,

              //button signup
              CustomButton(
                onPressed: () async {
                  setState(() {
                    isLaoding = true;
                  });

                  String responce = await AuthMethods().signUp(
                      _emailController.text,
                      _passwordController.text,
                      _userNameController.text);

                  if (responce == 'succes') {
                    setState(() {
                      isLaoding = false;
                    });

                    goTo(context, LoginScreen());
                  } else {
                    setState(() {
                      isLaoding = false;
                    });
                  }
                },
                text: 'Sign up with email',
                isLoading: isLaoding,
              ),

              smallPaddingHor,
              // button google
              FooterAuth(
                  onTap: () {
                    goTo(context, LoginScreen());
                  },
                  text: 'create your  Account',
                  bttext: 'Sign in')
            ],
          ),
        ),
      ),
    );
  }
}
