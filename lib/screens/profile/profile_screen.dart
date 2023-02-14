import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
import 'package:rayek_v001/screens/profile/widget/curver_clipper.dart';
import 'package:rayek_v001/utils/utils.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
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
                  Positioned(
                    top: 5,
                    left: 10,
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back),
                      color: BgColor,
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
                          child: const ClipOval(
                            child: Image(
                              height: 120,
                              width: 120,
                              image:
                                  AssetImage('assets/images/pic-person-03.jpg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        //4d child icon add pictur
                        Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              width: 40,
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                border: Border.all(width: 0.7, color: BtColor),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.add_a_photo_rounded),
                                color: BtColor,
                                //iconSize: 22,
                              ),
                            )),
                      ],
                    ),
                  ),
                ],
              ),
              smallPaddingHor,
              Center(
                child: Text(
                  "User Name",
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
                      Text("7455", style: LargeStyle),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
