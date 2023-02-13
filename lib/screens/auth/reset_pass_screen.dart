import 'package:flutter/material.dart';

import 'package:rayek_v001/screens/auth/auth.dart';
import 'package:rayek_v001/screens/auth/widget/form_text.dart';
import 'package:rayek_v001/screens/home/home_screen.dart';
import 'package:rayek_v001/utils/utils.dart';

import '../../resources/auth_methods.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/logo_app.dart';

class ResetPassScreen extends StatefulWidget {
  const ResetPassScreen({super.key});

  @override
  State<ResetPassScreen> createState() => _ResetPassScreenState();
}

class _ResetPassScreenState extends State<ResetPassScreen> {
  final _passTextController = TextEditingController();
  final _confPassTextController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool isLoading = false;

  @override
  void dispose() {
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
              const Text('Reset Password  ?',
                  textAlign: TextAlign.center, style: boldTitleStyle),

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
                            isPassword: true,
                            iconName: Icon(
                              Icons.lock_outline_rounded,
                              color: BtColor,
                            ),
                            controller: _passTextController,
                            hintText: "New Password",
                          ),
                          smallPaddingHor,
                          TextFieldAuth(
                            isPassword: true,
                            iconName: Icon(
                              Icons.lock_outline_rounded,
                              color: BtColor,
                            ),
                            controller: _confPassTextController,
                            hintText: "confirme new Password",
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
                onPressed: (() {}),
                text: 'Submit',
                isLoading: isLoading,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
