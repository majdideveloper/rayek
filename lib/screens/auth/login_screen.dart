import 'package:flutter/material.dart';

import 'package:rayek_v001/screens/auth/auth.dart';
import 'package:rayek_v001/utils/utils.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailTextController = TextEditingController();
  final _passTextController = TextEditingController();
  final _passFocusNode = FocusNode();
  final _formKey = GlobalKey<FormState>();
  var _obscureText = true;

  final _searchTextcontroller = TextEditingController();

  @override
  void dispose() {
    _emailTextController.dispose();
    _passTextController.dispose();
    _passFocusNode.dispose();
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
        body: Column(
          children: [
            // Logo

            // text Logo

            // form
            Form(
              key: _formKey,
              child: Column(
                children: [
                  // TextFormField(
                  //   textInputAction: TextInputAction.next,
                  //   onEditingComplete: () =>
                  //       FocusScope.of(context).requestFocus(_passFocusNode),
                  //   controller: _emailTextController,
                  //   keyboardType: TextInputType.emailAddress,
                  //   validator: (value) {
                  //     if (value!.isEmpty || !value.contains('@')) {
                  //       return 'Please enter a valid email address';
                  //     } else {
                  //       return null;
                  //     }
                  //   },
                  //   style: const TextStyle(color: Colors.white),
                  //   decoration: const InputDecoration(
                  //     hintText: 'Email',
                  //     hintStyle: TextStyle(color: Colors.white),
                  //     enabledBorder: UnderlineInputBorder(
                  //       borderSide: BorderSide(color: Colors.white),
                  //     ),
                  //     focusedBorder: UnderlineInputBorder(
                  //       borderSide: BorderSide(color: Colors.white),
                  //     ),
                  //   ),
                  // ),
                  TextFieldAuth(
                    controller: _emailTextController,
                    hintText: 'email',
                    passFocusNode: _passFocusNode,
                  ),
                  smallPaddingHor,
                  SizedBox(
                    height: 12,
                  ),
                  //Password

                  TextFormField(
                    textInputAction: TextInputAction.done,
                    onEditingComplete: () {
                      _submitFormOnLogin();
                    },
                    controller: _passTextController,
                    focusNode: _passFocusNode,
                    obscureText: _obscureText,
                    keyboardType: TextInputType.visiblePassword,
                    validator: (value) {
                      if (value!.isEmpty || value.length < 7) {
                        return 'Please enter a valid password';
                      } else {
                        return null;
                      }
                    },
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              _obscureText = !_obscureText;
                            });
                          },
                          child: Icon(
                            _obscureText
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.white,
                          )),
                      hintText: 'Password',
                      hintStyle: const TextStyle(color: Colors.white),
                      enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // button

            // footer
          ],
        ),
      ),
    );
  }
}
