import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

import 'package:rayek_v001/providers/user_provider.dart';
import 'package:rayek_v001/screens/profile/widget/curver_clipper.dart';
import 'package:rayek_v001/utils/utils.dart';

import '../../models/user.dart';
import '../../resources/auth_methods.dart';
import '../auth/welcome_screen.dart';

class ProfileScreen extends StatefulWidget {
  UserModel? user;
  ProfileScreen({
    Key? key,
    this.user,
  }) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Consumer<UserProvider>(
          builder: (context, provider, child) => SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    // 1st child container with clip path
                    ClipPath(
                      clipper: CurveClipper(),
                      child: Container(
                        color: BtColor,
                        height: 200,
                      ),
                    ),
                    //2sd child icone
                    Visibility(
                      visible: widget.user != null,
                      child: Positioned(
                        top: 5,
                        left: 10,
                        child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(Icons.arrow_back),
                          color: Colors.white,
                        ),
                      ),
                    ),

                    //3rd child phot pprofile
                    Positioned(
                      bottom: 5,
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(width: 3, color: BtColor),
                              boxShadow: const [
                                BoxShadow(
                                    color: Colors.black45,
                                    offset: Offset(0, 2.2),
                                    blurRadius: 8),
                              ],
                            ),
                            child: ClipOval(
                              child: Image.network(
                                widget.user == null
                                    ? provider.getUser.photoUrl
                                    : widget.user!.photoUrl,
                                height: 120,
                                width: 120,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          //4d child icon add pictur

                          Visibility(
                            visible: widget.user == null,
                            child: Positioned(
                                bottom: 0,
                                right: 0,
                                child: Container(
                                  width: 40,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[200],
                                    border:
                                        Border.all(width: 0.7, color: BtColor),
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.add_a_photo_rounded),
                                    color: BtColor,
                                    //iconSize: 22,
                                  ),
                                )),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                //second part
                smallPaddingHor,
                Center(
                  child: Text(
                    widget.user == null
                        ? provider.getUser.username
                        : widget.user!.username,
                    //    "User Name",
                    style: boldTitleStyle,
                  ),
                ),
                smallPaddingHor,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Text(
                          "Posts",
                          style: LargeStyle,
                        ),
                        Text("123", style: LargeStyle),
                      ],
                    ),
                    Column(
                      children: [
                        Text("Followers", style: LargeStyle),
                        Text("1452", style: LargeStyle),
                      ],
                    ),
                    Column(
                      children: [
                        Text("Follows", style: LargeStyle),
                        Text(provider.getUser.followers.length.toString(),
                            style: LargeStyle),
                      ],
                    )
                  ],
                ),
                // if current usser log out
                // else follow unfflow button
                widget.user == null
                    ? TextButton(
                        onPressed: () {
                          AuthMethods().signOut();
                          goToAndForget(context, const WelcomeScreen());
                        },
                        child: const Text("log out"),
                      )
                    : TextButton(
                        onPressed: () {},
                        child: const Text("Follow"),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
