import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:rayek_v001/models/question.dart';
import 'package:rayek_v001/screens/home/widget/post_widget.dart';

import 'package:rayek_v001/utils/utils.dart';
import 'package:rayek_v001/widgets/logo_app.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar
      appBar: AppBar(
        backgroundColor: BgColor,
        centerTitle: true,
        leading: LogoApp(
          size: 50,
        ),
        title: const Text(
          "RAYEK",
          style: TextStyle(
              letterSpacing: 10,
              color: BtColor,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // const CategorieWidgts(),

          //synchronise data in time
          StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection("questions")
                  .orderBy('datePublished', descending: true)
                  .snapshots(),
              builder: ((context, snapshot) {
                return (snapshot.connectionState == ConnectionState.waiting)
                    ? const Center(
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
                              //on tap card of post we will show the entier
                              // post in show dialog show question with img/oprtion of the poll
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
