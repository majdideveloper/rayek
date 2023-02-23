import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:flutter_polls/flutter_polls.dart';

import 'package:rayek_v001/models/question.dart';

import '../../utils/utils.dart';

class PostScreen extends StatefulWidget {
  final PostQuestion question;
  const PostScreen({
    Key? key,
    required this.question,
  }) : super(key: key);

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  late List updateList;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateList = widget.question.responses;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 600,
        width: 300,
        child: FlutterPolls(
          hasVoted: [1, 2, 3].contains(9),
          userVotedOptionId: 1,

          pollId: widget.question.postId,
          // party desgin polls
          pollTitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //profile pic
              ListTile(
                leading: CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(widget.question.profImage),
                ),
                //user name
                title: Text(
                  widget.question.username,
                  style: boldTitleStyle,
                ),
              ),
              //question imag post
              smallPaddingHor,
              Image.network(
                widget.question.postUrl,
                height: 300,
                width: double.infinity,
                fit: BoxFit.fitWidth,
              ),
              smallPaddingHor,
              //question post
              Text(
                widget.question.question,
                style: boldTitleStyle,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              smallPaddingHor,
            ],
          ),

          // party logic polls
          onVoted: (pollOption, newTotalVotes) async {
            setState(() async {
              updateList[pollOption.id!]["votes"] + 1;
            });

            await Future.delayed(const Duration(seconds: 3));
            // FirebaseFirestore.instance
            //     .collection("qustions")
            //     .doc(widget.question.postId)
            //     .update({'responses': updateList});

            print('Voted: ${pollOption.id}');
            print('Voted: ${pollOption.votes}');

            /// If HTTP status is success, return true else false
            return true;
          },
          pollOptions: List.from(
            widget.question.responses.map(
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
        ));
  }
}
