import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rayek_v001/resources/auth_methods.dart';
import 'package:rayek_v001/screens/auth/auth.dart';
import 'package:rayek_v001/screens/home/widget/categorie_widget.dart';

import 'package:rayek_v001/utils/utils.dart';

import '../profile/profile_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const CategorieWidgts(),
          const Center(
            child: Text(
              'home',
              style: boldTitleStyle,
            ),
          ),
          TextButton(
            onPressed: () {
              goTo(context, const ProfileScreen());
            },
            child: const Text("profile"),
          ),
          TextButton(
            onPressed: () {
              AuthMethods().signOut();
              goToAndForget(context, const WelcomeScreen());
            },
            child: const Text("log out"),
          ),
        ],
      ),
    );
  }
}
