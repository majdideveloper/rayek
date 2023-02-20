import 'package:flutter/material.dart';

import 'package:rayek_v001/models/question.dart';
import 'package:rayek_v001/utils/utils.dart';

class PostWidget extends StatelessWidget {
  final PostQuestion question;
  const PostWidget({
    Key? key,
    required this.question,
  }) : super(key: key);

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
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(question.profImage),
                  ),
                  smallPaddingVer,
                  Text(
                    question.username,
                    style: boldTitleStyle,
                  )
                ],
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
        ),
      ),
    );
  }
}
