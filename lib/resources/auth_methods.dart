import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/user.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> signUp(String email, String password, String username) async {
    String resultat = "";

    try {
      // start
      UserCredential currentUser = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      UserModel _user = UserModel(
        username: username,
        uid: currentUser.user!.uid,
        photoUrl: "",
        email: email,
        followers: [],
        following: [],
      );

      // adding user in our database
      await _firestore
          .collection("users")
          .doc(currentUser.user!.uid)
          .set(_user.toJson());

      // end
      resultat = 'succes';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
    return resultat;
  }
}
