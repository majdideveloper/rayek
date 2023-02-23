import 'dart:io';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:rayek_v001/providers/app_provider.dart';

import 'package:rayek_v001/providers/user_provider.dart';
import 'package:rayek_v001/resources/firestore_methods.dart';
import 'package:rayek_v001/resources/storage_methods.dart';
import 'package:rayek_v001/screens/auth/auth.dart';
import 'package:rayek_v001/screens/profile/widget/curver_clipper.dart';
import 'package:rayek_v001/utils/utils.dart';
import 'package:rayek_v001/widgets/infollow.dart';
import 'package:rayek_v001/widgets/logout_buttom.dart';

import '../../models/question.dart';
import '../../models/user.dart';
import '../../resources/auth_methods.dart';
import '../auth/welcome_screen.dart';
import '../home/widget/post_widget.dart';

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
  XFile? tempImg;

  // function pick image from gallory
  Future pickImage() async {
    try {
      tempImg = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (tempImg == null) return null;
    } on PlatformException catch (e) {
      print('error $e');
    }
  }

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
                            )),
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
                                    onPressed: () async {
                                      // icon tchange image
                                      await pickImage();
                                      showLoadingDialog(context,
                                          'https://lottie.host/3fbe4e60-14cc-4792-9e41-e927020b3ee2/BKmG5z7oRW.json');
                                      await FirestoreMethods()
                                          .uploadImageProfile(tempImg!);
                                      context
                                          .read<UserProvider>()
                                          .refreshUser();
                                      Navigator.pop(context);
                                    },
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
                        const Text("Follows", style: LargeStyle),
                        Text(
                            widget.user == null
                                ? provider.getUser.following.length.toString()
                                : widget.user!.following.length.toString(),
                            style: LargeStyle),
                      ],
                    ),
                    Column(
                      children: [
                        const Text("Followers", style: LargeStyle),
                        Text(
                            widget.user == null
                                ? provider.getUser.followers.length.toString()
                                : widget.user!.followers.length.toString(),
                            style: LargeStyle),
                      ],
                    )
                  ],
                ),
                // if current usser log out
                // else follow unfflow button
                smallPaddingHor,
                widget.user == null
                    ? LogOutButton(
                        onPressed: () async {
                          await AuthMethods().signOut();

                          goToAndForget(context, const LoginScreen());
                        },
                        text: 'LogOut',
                        icon: Icon(
                          Icons.logout_rounded,
                          color: BtColor,
                        ),
                      )
                    : LogOutButton(
                        onPressed: () {
                          setState(() {
                            FirebaseFirestore.instance
                                .collection("users")
                                .doc(widget.user!.uid)
                                .update({
                              'followers':
                                  FieldValue.arrayUnion([provider.getUser.uid])
                            });
                            FirebaseFirestore.instance
                                .collection("users")
                                .doc(provider.getUser.uid)
                                .update({
                              'following':
                                  FieldValue.arrayUnion([widget.user!.uid])
                            });
                          });

                          context.read<UserProvider>().refreshUser();
                        },
                        text: 'Follow',
                        icon: Icon(
                          Icons.favorite_border,
                          color: BtColor,
                        ),
                      ),

                // last party of screen listView all Posts of user
                const Divider(
                  thickness: 3,
                  endIndent: 10,
                  indent: 10,
                  color: BtColor,
                ),
                const Center(
                  child: Text(
                    "Posts",
                    style: boldTitleStyle,
                  ),
                ),
                const Divider(
                  thickness: 3,
                  endIndent: 10,
                  indent: 10,
                  color: BtColor,
                ),
                // last part listView with streamBuilder
                StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection("questions")
                        .where("username",
                            isEqualTo: widget.user == null
                                ? provider.getUser.username
                                : widget.user!.username)
                        .snapshots(),
                    builder: ((context, snapshot) {
                      return (snapshot.connectionState ==
                              ConnectionState.waiting)
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : SizedBox(
                              height: 500,
                              child: ListView.separated(
                                  separatorBuilder: ((context, index) =>
                                      smallPaddingHor),
                                  itemCount: snapshot.data!.docs.length,
                                  itemBuilder: ((context, index) {
                                    PostQuestion question =
                                        PostQuestion.fromSnap(
                                            snapshot.data!.docs[index]);

                                    return PostWidget(
                                      question: question,
                                      myPost:
                                          widget.user == null ? true : false,
                                    );
                                  })));
                    })),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
