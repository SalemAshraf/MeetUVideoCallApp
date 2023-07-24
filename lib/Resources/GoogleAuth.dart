// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:meetu/Utils/snackBar.dart';
// ignore_for_file: non_constant_identifier_names, use_key_in_widget_constructors, use_build_context_synchronously

class GoogleAuth {
  final FirebaseAuth firebase_auth = FirebaseAuth.instance;
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  Stream<User?> get authChanges => firebase_auth.authStateChanges();
  User get user => firebase_auth.currentUser!;

  Future<bool> SignIn(BuildContext context) async {
    bool isUser = false;
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleSignInAuthentication =
          await googleSignInAccount?.authentication;
      final credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication?.accessToken,
          idToken: googleSignInAuthentication?.idToken);

      UserCredential userCredential =
          await firebase_auth.signInWithCredential(credential);

      User? user = userCredential.user;

      if (user != null) {
        if (userCredential.additionalUserInfo!.isNewUser) {
          await firebaseFirestore.collection("users").doc(user.uid).set({
            "userName": user.displayName,
            "uid": user.uid,
            "email": user.email,
            "profilePhoto": user.photoURL
          });
        }
        isUser = true;
      }
    } on FirebaseAuthException catch (e) {
      isUser = false;
      showSnackBar(context, e.message!);
    }
    return isUser;
  }

  void signOut() async {
    try {
      firebase_auth.signOut();
    } catch (e) {
      print(e);
    }
  }
}
