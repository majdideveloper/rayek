import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polls/flutter_polls.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:rayek_v001/providers/app_provider.dart';
import 'package:rayek_v001/providers/user_provider.dart';
import 'package:rayek_v001/utils/utils.dart';

import '../models/question.dart';

void goTo(BuildContext context, Widget nextPage) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => nextPage));
}

void goToAndForget(BuildContext context, Widget nextPage) {
  Navigator.pushAndRemoveUntil(context,
      MaterialPageRoute(builder: (context) => nextPage), (route) => false);
}

void showSnackBar(BuildContext context, String text) {
  final snackBar = SnackBar(
      backgroundColor: BtColor,
      content: Text(
        text,
      ));
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

void alertDialog(BuildContext context, String message) {
  AlertDialog alert = AlertDialog(
    title: const Text("Alert", style: H3Style),
    content: Text(
      message,
      style: alertStyle,
    ),
    actions: [
      TextButton(
        child: Text("OK", style: H3Style),
        onPressed: () {
          // Do something when OK is pressed
          Navigator.of(context).pop();
        },
      ),
    ],
  );
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

void alertDialogDeletePost(BuildContext context, String message,
    {void Function()? onPressed}) {
  AlertDialog alert = AlertDialog(
    title: const Text("Alert", style: H3Style),
    content: Text(
      message,
      style: alertStyle,
    ),
    actions: [
      TextButton(
        child: Text("Cancel", style: H3Style),
        onPressed: () {
          // Do something when OK is pressed
          Navigator.of(context).pop();
        },
      ),
      TextButton(child: Text("OK", style: H3Style), onPressed: onPressed),
    ],
  );
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

void showLoadingDialog(BuildContext context, String url) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return WillPopScope(
        onWillPop: () async => false,
        child: AlertDialog(
            content: Container(
          child: Lottie.network(url, height: 250, width: 250),
        )),
      );
    },
  );
}

void showPost(BuildContext context, PostQuestion question) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      final provider = Provider.of<AppProvider>(context);
      final user = Provider.of<UserProvider>(context);
      return SingleChildScrollView(
        child: WillPopScope(
            onWillPop: () async => false,
            child: AlertDialog(
              actions: [
                TextButton(
                  child: Text("Cancel", style: H3Style),
                  onPressed: () {
                    // Do something when OK is pressed
                    Navigator.of(context).pop();
                  },
                ),
              ],
              content: SizedBox(
                  height: 600,
                  width: 300,
                  child: FlutterPolls(
                    hasVoted: question.usersVotedId.contains(user.getUser.uid),
                    userVotedOptionId: 1,

                    pollId: question.postId,
                    // party desgin polls
                    pollTitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListTile(
                          leading: CircleAvatar(
                            radius: 30,
                            backgroundImage: NetworkImage(question.profImage),
                          ),
                          title: Text(
                            question.username,
                            style: boldTitleStyle,
                          ),
                        ),
                        smallPaddingHor,
                        Image.network(
                          question.postUrl,
                          height: 300,
                          width: double.infinity,
                          fit: BoxFit.fitWidth,
                        ),
                        smallPaddingHor,
                        Text(
                          question.question,
                          style: boldTitleStyle,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        smallPaddingHor,
                      ],
                    ),

                    // party logic polls
                    onVoted: (pollOption, newTotalVotes) async {
                      provider.addData = question.responses;
                      print(provider.getDataList);

                      provider.updateData(pollOption.id!);
                      print(provider.getDataList);

                      await Future.delayed(const Duration(seconds: 3));
                      FirebaseFirestore.instance
                          .collection("questions")
                          .doc(question.postId)
                          .update({
                        'responses': provider.getDataList,
                        'usersVotedId':
                            FieldValue.arrayUnion([user.getUser.uid])
                      });

                      // print('Voted: ${pollOption.id}');
                      // print('Voted: ${pollOption.votes}');

                      /// If HTTP status is success, return true else false
                      return true;
                    },
                    pollOptions: List.from(
                      question.responses.map(
                        (option) {
                          return PollOption(
                            id: option['id'],
                            title: Text(
                              option['reponse'],
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            votes: option['votes'],
                          );
                        },
                      ),
                    ),
                  )),
            )),
      );
    },
  );
}
