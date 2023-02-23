import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';

import 'package:rayek_v001/models/question.dart';
import 'package:rayek_v001/utils/utils.dart';

class PostWidget extends StatelessWidget {
  final PostQuestion question;
  final bool myPost;
  const PostWidget({Key? key, required this.question, required this.myPost})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        elevation: 10.0,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                leading: CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.grey[300],
                  backgroundImage: NetworkImage(question.profImage),
                ),

                // Container(
                //   decoration: BoxDecoration(
                //     shape: BoxShape.circle,
                //   ),
                //   child: FancyShimmerImage(
                //     imageUrl: question.postUrl,
                //     // height: 300,
                //     width: double.infinity,
                //     boxFit: BoxFit.fitWidth,
                //   ),
                // ),
                title: Text(
                  question.username,
                  style: boldTitleStyle,
                ),
                trailing: myPost
                    ? IconButton(
                        onPressed: () {
                          alertDialogDeletePost(
                              context, "are you sure delete Post",
                              onPressed: () async {
                            Navigator.pop(context);
                            showLoadingDialog(context,
                                'https://assets2.lottiefiles.com/packages/lf20_vvrfedzr.json');

                            await Future.delayed(Duration(seconds: 4));
                            FirebaseFirestore.instance
                                .collection("questions")
                                .doc(question.postId)
                                .delete();
                            Navigator.pop(context);
                          });
                        },
                        icon: Icon(
                          Icons.delete_forever,
                          color: BtColor,
                        ))
                    : SizedBox.shrink(),
              ),
              smallPaddingHor,
              FancyShimmerImage(
                imageUrl: question.postUrl,
                height: 300,
                width: double.infinity,
                boxFit: BoxFit.fitWidth,
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
        ),
      ),
    );
  }
}
