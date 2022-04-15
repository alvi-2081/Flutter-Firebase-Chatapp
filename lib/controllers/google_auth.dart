import 'package:chat_app/main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/material.dart';

GoogleSignIn google_SignIn = GoogleSignIn();
FirebaseFirestore firestore = FirebaseFirestore.instance;

Future googleSignIn(BuildContext context) async {
  GoogleSignInAccount? googleUser = await google_SignIn.signIn();
  if (googleUser == null) {
    return;
  }
  final googleAuth = await googleUser.authentication;
  final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
  UserCredential userCredential =
      await FirebaseAuth.instance.signInWithCredential(credential);

  DocumentSnapshot userExist =
      await firestore.collection('users').doc(userCredential.user!.uid).get();

  if (userExist.exists) {
    print("User Already Exists in Database");
  } else {
    await firestore.collection('users').doc(userCredential.user!.uid).set({
      'email': userCredential.user!.email,
      'name': userCredential.user!.displayName,
      'image': userCredential.user!.photoURL,
      'uid': userCredential.user!.uid,
      'date': DateTime.now(),
    });
  }

  Navigator.pushAndRemoveUntil(context,
      MaterialPageRoute(builder: (context) => MyApp()), (route) => false);
}
