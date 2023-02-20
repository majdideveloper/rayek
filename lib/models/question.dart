import 'package:cloud_firestore/cloud_firestore.dart';

class PostQuestion {
  final String question;
  final String userId;
  final String username;
  final String category;
  final responses;
  final String postId;
  final datePublished;
  final String postUrl;
  final String profImage;

  const PostQuestion({
    required this.question,
    required this.userId,
    required this.username,
    required this.category,
    required this.responses,
    required this.postId,
    required this.datePublished,
    required this.postUrl,
    required this.profImage,
  });

  static PostQuestion fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return PostQuestion(
        question: snapshot["question"],
        userId: snapshot["userId"],
        responses: snapshot["responses"],
        category: snapshot["category"],
        postId: snapshot["postId"],
        datePublished: snapshot["datePublished"],
        username: snapshot["username"],
        postUrl: snapshot['postUrl'],
        profImage: snapshot['profImage']);
  }

  Map<String, dynamic> toJson() => {
        "question": question,
        "userId": userId,
        "responses": responses,
        "category": category,
        "username": username,
        "postId": postId,
        "datePublished": datePublished,
        'postUrl': postUrl,
        'profImage': profImage
      };
}
