import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/user.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

// Sign Up
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
        return ('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        return ('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
    return resultat;
  }

  Future<String> logIn(String email, String password) async {
    String response = '';
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      response = 'succes';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        return ('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
        return ('Wrong password provided for that user.');
      }
    }
    return response;
  }

  // Sign out
  signOut() async {
    await _auth.signOut();
  }

  //get information user
  Future<UserModel> getUserDetails() async {
    // garantie user moujoud
    User currentUser = _auth.currentUser!;

    DocumentSnapshot documentSnapshot =
        await _firestore.collection('users').doc(currentUser.uid).get();

    return UserModel.fromSnap(documentSnapshot);
  }

  // forget Password

  Future<String> resetPassword(String email) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      return "succes";
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return ('No user found for that email.');
      } else {
        return ('An error occurred while resetting the password: $e');
      }
    }
  }
}
