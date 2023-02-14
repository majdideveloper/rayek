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

              meduimPaddingHor,
              Center(child: LogoApp()),

              //Text welcome
              const Text('Welcome back. \nCome on in.!!',
                  textAlign: TextAlign.center, style: H3Style),
              const Text('Login into your Account',
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
                          smallPaddingHor,
                          //password form text
                          TextFieldAuth(
                            iconName: const Icon(
                              Icons.lock_outline_rounded,
                              color: BtColor,
                            ),
                            suffixIconName: const Icon(
                              Icons.lock_outline_rounded,
                              color: BtColor,
                            ),
                            controller: _passTextController,
                            hintText: "password",
                            isPassword: true,
                            viewSuffixPassword: true,
                            validator: (value) {
                              if (value!.length < 6) {
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
                    Align(
                        alignment: Alignment.topRight,
                        child: InkWell(
                          onTap: () {
                            // goTo(context, RegisterScreen());
                            goTo(context, ForgerPassScreen());
                          },
                          child: Text(
                            "Forget Passsword ?",
                            style: H2Style.copyWith(fontSize: 16),
                          ),
                        )),
                  ],
                ),
              ),

              meduimPaddingHor,

              //button signup

              CustomButton(
                onPressed: () async {
                  bool validate = _formKey.currentState!.validate();
                  if (validate) {
                    setState(() {
                      isLoading = true;
                    });

                    String responce = await AuthMethods().logIn(
                        _emailTextController.text, _passTextController.text);

                    if (responce == 'succes') {
                      setState(() {
                        isLoading = false;
                      });

                      goToAndForget(context, HomeScreen());
                    } else {
                      setState(() {
                        isLoading = false;
                        if (responce == "") responce = "something errorrrr";
                        print(responce);
                      });
                      showSnackBar(context, responce);
                    }
                  }
                },
                text: 'Log in',
                isLoading: isLoading,
              ),
              smallPaddingHor,

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
