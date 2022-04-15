import 'package:chat_app/controllers/google_auth.dart';
import 'package:chat_app/main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleAuth extends StatefulWidget {
  const GoogleAuth({Key? key}) : super(key: key);

  @override
  State<GoogleAuth> createState() => _GoogleAuthState();
}

class _GoogleAuthState extends State<GoogleAuth> {
  // GoogleSignIn google_SignIn = GoogleSignIn();
  // FirebaseFirestore firestore = FirebaseFirestore.instance;

  // Future googleSignIn() async {
  //   GoogleSignInAccount? googleUser = await google_SignIn.signIn();
  //   if (googleUser == null) {
  //     return;
  //   }
  //   final googleAuth = await googleUser.authentication;
  //   final credential = GoogleAuthProvider.credential(
  //       accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
  //   UserCredential userCredential =
  //       await FirebaseAuth.instance.signInWithCredential(credential);

  //   DocumentSnapshot userExist =
  //       await firestore.collection('users').doc(userCredential.user!.uid).get();

  //   if (userExist.exists) {
  //     print("User Already Exists in Database");
  //   } else {
  //     await firestore.collection('users').doc(userCredential.user!.uid).set({
  //       'email': userCredential.user!.email,
  //       'name': userCredential.user!.displayName,
  //       'image': userCredential.user!.photoURL,
  //       'uid': userCredential.user!.uid,
  //       'date': DateTime.now(),
  //     });
  //   }

  //   Navigator.pushAndRemoveUntil(context,
  //       MaterialPageRoute(builder: (context) => MyApp()), (route) => false);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: Container(
                  decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/chat_icon.png'),
                ),
              )),
            ),
            Text(
              "Flutter Chat App",
              style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: ElevatedButton(
                onPressed: () async {
                  await googleSignIn(context);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/google.png", height: 36),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Sign in With Google",
                      style: TextStyle(fontSize: 20),
                    )
                  ],
                ),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.black),
                    padding: MaterialStateProperty.all(
                        EdgeInsets.symmetric(vertical: 12))),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
