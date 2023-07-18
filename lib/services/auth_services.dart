import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  static User? user;
  // Google Sign In
  SignInWithGoogle() async {
    // begin interactive sign in process
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();

    // obtain auth details from request
    final GoogleSignInAuthentication gAuth = await gUser!.authentication;

    // create a new credential for user
    AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: gAuth?.accessToken,
      idToken: gAuth.idToken,
    );

    // finally, lets sign in
    user = (await FirebaseAuth.instance.signInWithCredential(credential)).user;
    await FirebaseFirestore.instance.collection('Users').doc(user!.email).set({
      "name": user!.displayName,
      "email": user!.email,
      "occupation": "Student",
      "phone": user!.phoneNumber,
    });

    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
