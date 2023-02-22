import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rayek_v001/models/question.dart';
import 'package:rayek_v001/resources/auth_methods.dart';
import 'package:rayek_v001/screens/auth/auth.dart';
import 'package:rayek_v001/screens/home/widget/categorie_widget.dart';
import 'package:rayek_v001/screens/home/widget/post_widget.dart';
import 'package:rayek_v001/screens/post/post_screen.dart';

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

          //
          StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection("questions")
                  .orderBy('datePublished', descending: true)
                  .snapshots(),
              builder: ((context, snapshot) {
                return (snapshot.connectionState == ConnectionState.waiting)
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : Flexible(
                        child: ListView.separated(
                            separatorBuilder: ((context, index) =>
                                smallPaddingHor),
                            itemCount: snapshot.data!.docs.length,
                            itemBuilder: ((context, index) {
                              PostQuestion question = PostQuestion.fromSnap(
                                  snapshot.data!.docs[index]);

                              return InkWell(
                                onTap: () => showPost(context, question),
                                child: PostWidget(
                                  question: question,
                                  myPost: false,
                                ),
                              );
                            })));
              })),
        ],
      ),
    );
  }
}
