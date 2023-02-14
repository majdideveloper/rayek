import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rayek_v001/resources/auth_methods.dart';
import 'package:rayek_v001/screens/auth/auth.dart';
import 'package:rayek_v001/screens/profile/widget/profile_image.dart';
import 'package:rayek_v001/utils/utils.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: FaIcon(FontAwesomeIcons.penClip),
        onPressed: () {},
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              'home',
              style: boldTitleStyle,
            ),
          ),
          TextButton(
            onPressed: () {
              AuthMethods().signOut();
              goToAndForget(context, const WelcomeScreen());
            },
            child: Text("log out"),
          ),
        ],
      ),
    );
  }
}
