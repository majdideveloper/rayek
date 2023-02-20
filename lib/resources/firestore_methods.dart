import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:rayek_v001/models/question.dart';
import 'package:rayek_v001/resources/storage_methods.dart';
import 'package:uuid/uuid.dart';

class FirestoreMethods {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> uploadQuestion({
    required String question,
    required Uint8List file,
    required String userId,
    required String username,
    required String category,
    required List responses,
    required String profImag,
  }) async {
    String res = "something errorr";
    try {
      String photoUrl =
          await StorageMethods().uploadImageToStorage('questions', file, true);

      String postId = Uuid().v1();

      PostQuestion postQuestion = PostQuestion(
          question: question,
          userId: userId,
          username: username,
          category: category,
          responses: responses,
          postId: postId,
          datePublished: DateTime.now(),
          postUrl: photoUrl,
          profImage: profImag);

      _firestore.collection("questions").doc(postId).set(postQuestion.toJson());
      return 'success';
    } catch (e) {
      res = e.toString();
    }
    return res;
  }
}
