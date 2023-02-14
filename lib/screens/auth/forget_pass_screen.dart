import 'package:flutter/material.dart';

import 'package:rayek_v001/screens/auth/auth.dart';
import 'package:rayek_v001/screens/auth/reset_pass_screen.dart';
import 'package:rayek_v001/screens/auth/widget/form_text.dart';
import 'package:rayek_v001/screens/home/home_screen.dart';
import 'package:rayek_v001/utils/utils.dart';

import '../../resources/auth_methods.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/logo_app.dart';

class ForgerPassScreen extends StatefulWidget {
  const ForgerPassScreen({super.key});

  @override
  State<ForgerPassScreen> createState() => _ForgerPassScreenState();
}

class _ForgerPassScreenState extends State<ForgerPassScreen> {
  final _emailTextController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool isLoading = false;

  @override
  void dispose() {
    _emailTextController.dispose();
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
              const Text('Forgot Password  ?',
                  textAlign: TextAlign.center, style: boldTitleStyle),
              const Padding(
                padding: EdgeInsets.only(left: 40, right: 50),
                child: Text(
                  'Don\'t worry!! It happens.Please enter the adress associated with your account.',
                  style: mediumStyle,
                ),
              ),

              // form Sign up
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
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
                            validator: (value) {
                              if (value!.isEmpty ||
                                  (!value.contains('@') &&
                                      !value.contains('.'))) {
                                return 'Please enter a valid email address';
                              } else {
                                return null;
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                    // forget password
                  ],
                ),
              ),

              meduimPaddingHor,

              //button signup
              CustomButton(
                onPressed: () async {
                  bool validate = _formKey.currentState!.validate();
                  if (validate) {
                    String responce = await AuthMethods()
                        .resetPassword(_emailTextController.text.trim());

                    if (responce == 'succes') responce = 'verfy your email';
                    showSnackBar(context, responce);
                  }
                },
                text: 'Reset Password',
                isLoading: isLoading,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
