import 'dart:io';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rayek_v001/models/question.dart';
import 'package:rayek_v001/resources/storage_methods.dart';
import 'package:uuid/uuid.dart';

class FirestoreMethods {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  FirebaseAuth _auth = FirebaseAuth.instance;

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
          profImage: profImag,
          usersVotedId: []);

      _firestore.collection("questions").doc(postId).set(postQuestion.toJson());
      return 'success';
    } catch (e) {
      res = e.toString();
    }
    return res;
  }

  Future uploadImageProfile(XFile image) async {
    String urlImage = await StorageMethods().uploadImageToStorage('imgProfile',
        Uint8List.fromList(File(image!.path).readAsBytesSync()), false);
    await FirebaseFirestore.instance
        .collection("users")
        .doc(_auth.currentUser!.uid)
        .update({"photoUrl": urlImage});
  }
}
