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

              Center(child: LogoApp()),
              //Text welcome
              const Text('Create Account\n with email',
                  textAlign: TextAlign.center, style: boldTitleStyle),
              // form Sign up
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFieldAuth(
                          iconName: Icon(
                            Icons.person_outline_rounded,
                            color: BtColor,
                          ),
                          controller: _userNameController,
                          hintText: "UserName",
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter user Name';
                            } else {
                              return null;
                            }
                          },
                        ),
                        smallPaddingHor,
                        //email form
                        TextFieldAuth(
                          iconName: Icon(
                            Icons.email_outlined,
                            color: BtColor,
                          ),
                          controller: _emailController,
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
                        smallPaddingHor,

                        //password form
                        TextFieldAuth(
                          iconName: Icon(
                            Icons.lock_outline_rounded,
                            color: BtColor,
                          ),
                          controller: _passwordController,
                          hintText: "password",
                          isPassword: true,
                          viewSuffixPassword: true,
                          validator: (value) {
                            if (value!.length < 6) {
                              return 'Please enter a valid password';
                            } else {
                              return null;
                            }
                          },
                        ),
                        smallPaddingHor,
                        TextFieldAuth(
                          iconName: Icon(
                            Icons.lock_outline_rounded,
                            color: BtColor,
                          ),
                          controller: _passwordConformationController,
                          hintText: "Confirm password",
                          isPassword: true,
                          viewSuffixPassword: true,
                          validator: (value) {
                            if (_passwordController.text !=
                                _passwordConformationController.text) {
                              return 'Please enter a valid confirmation password';
                            } else {
                              return null;
                            }
                          },
                        ),
                      ],
                    )),
              ),

              smallPaddingHor,

              //button signup
              CustomButton(
                onPressed: () async {
                  bool validate = _formKey.currentState!.validate();

                  if (validate) {
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
                        if (responce == "") responce = "something errorrrr";
                      });

                      showSnackBar(context, responce);
                    }
                  }
                },
                text: 'Create Account ',
                isLoading: isLaoding,
              ),

              smallPaddingHor,
              // button google
              FooterAuth(
                  onTap: () {
                    goTo(context, LoginScreen());
                  },
                  text: 'Already have Account? ',
                  bttext: 'Log in')
            ],
          ),
        ),
      ),
    );
  }
}
