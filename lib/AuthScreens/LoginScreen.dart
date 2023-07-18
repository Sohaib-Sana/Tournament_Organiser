// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:tournament_organizer/AuthScreensComponents/AuthButtons.dart';
import 'package:tournament_organizer/Screens/HomeScreen.dart';
import 'package:tournament_organizer/services/auth_services.dart';
import 'ForgetPasswordScreen.dart';
import 'package:tournament_organizer/Screens/Dashboard.dart';
import 'ResetPasswordScreen.dart';
import 'SignupScreen.dart';
// import 'package:tournament_organizer/UserSharedPreferences.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../Screens/LoadingScreen.dart';

class LoginScreen extends StatefulWidget {
  static String id = "LoginScreen";
  const LoginScreen({Key? key}) : super(key: key);
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  late String _email;
  late String _password;
  bool isPasswordVisible = true;
  // late String userId;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    const Color textAndIconsColor = Colors.black38;
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    return isLoading
        ? const LoadingScreen()
        : Scaffold(
            body: SafeArea(
              child: Container(
                color: Colors.white,
                alignment: Alignment.topCenter,
                child: SingleChildScrollView(
                  reverse: true,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      // Image on Top.
                      Container(
                        height: deviceHeight / 3,
                        child: Image(
                          // height: deviceHeight / 3,
                          width: deviceWidth,
                          image: const AssetImage('images/Login.png'),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(25),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            // Login Heading.
                            const Text(
                              "Login",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 35,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            // This column contains email text field to Create account textField.
                            Column(
                              children: <Widget>[
                                const SizedBox(height: 20),
                                // Email TextField.
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, right: 20),
                                  child: TextField(
                                    textAlign: TextAlign.start,
                                    keyboardType: TextInputType.emailAddress,
                                    style: TextStyle(color: Colors.black54),
                                    decoration: const InputDecoration(
                                      icon: Icon(Icons.alternate_email),
                                      iconColor: textAndIconsColor,
                                      hintText: "Enter your Email.",
                                      hintStyle:
                                          TextStyle(color: textAndIconsColor),
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 2, color: textAndIconsColor),
                                      ),
                                    ),
                                    onChanged: (value) {
                                      _email = value
                                          .replaceAll(" ", "")
                                          .toLowerCase();
                                    },
                                  ),
                                ),
                                // Password TextField
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, right: 20),
                                  child: TextField(
                                    obscureText: isPasswordVisible,
                                    textAlign: TextAlign.start,
                                    style: TextStyle(color: Colors.black54),
                                    decoration: InputDecoration(
                                      icon: Icon(Icons.security_outlined),
                                      iconColor: textAndIconsColor,
                                      suffixIcon: IconButton(
                                        icon: Icon(Icons.remove_red_eye_sharp),
                                        onPressed: () => {
                                          setState(() {
                                            isPasswordVisible =
                                                !isPasswordVisible;
                                          })
                                        },
                                      ),
                                      suffixIconColor: textAndIconsColor,
                                      hintText: "Enter your Password.",
                                      hintStyle: const TextStyle(
                                          color: textAndIconsColor),
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 2, color: textAndIconsColor),
                                      ),
                                    ),
                                    onChanged: (value) {
                                      _password = value;
                                    },
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 10.0, right: 20.0, bottom: 10),
                                    child: RichText(
                                      text: TextSpan(
                                        text: "Forget Password?",
                                        style: const TextStyle(
                                          color: Color(0xff0165fe),
                                          decoration: TextDecoration.underline,
                                        ),
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            // UserSharedPreferences.setStatus(true);
                                            Navigator.pushNamed(context,
                                                ForgetPasswordScreen.id);
                                          },
                                      ),
                                    ),
                                  ),
                                ),
                                // Login Button.
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 12.0),
                                  child: customAuthButton(
                                    onTap: () async {
                                      setState(() {
                                        isLoading = true;
                                      });
                                      try {
                                        _auth
                                            .signInWithEmailAndPassword(
                                                email: _email,
                                                password: _password)
                                            .then((value) =>
                                                Navigator.popAndPushNamed(
                                                    context, HomeScreen.id));
                                        setState(() {
                                          isLoading = false;
                                        });
                                      } catch (e) {
                                        setState(() {
                                          isLoading = false;
                                        });
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(const SnackBar(
                                                content: Text(
                                                    "Please Fill all field with valid data with active internet connection."))); // TODO : Alert of error.
                                      }
                                    },
                                    text: "Login",
                                    color: const Color(0xff0165fe),
                                    width: (deviceWidth / 2) * 1.4,
                                  ),
                                ),
                                const Text(
                                  "-------------OR-------------",
                                  style: TextStyle(
                                    color: Colors.black26,
                                  ),
                                ),
                                // Google Signin Button.
                                GestureDetector(
                                  onTap: () async {
                                    try {
                                      await AuthService().SignInWithGoogle();
                                      Navigator.popAndPushNamed(
                                          context, HomeScreen.id);
                                    } catch (e) {
                                      print(e);
                                    }
                                  },
                                  child: Container(
                                    width: (deviceWidth / 2) * 1.4,
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color: Colors.grey[300],
                                    ),
                                    margin: const EdgeInsets.only(top: 10),
                                    child: Row(
                                      children: const <Widget>[
                                        Padding(
                                          padding: EdgeInsets.only(
                                              left: 8, right: 15),
                                          child: Image(
                                            width: 23,
                                            image: AssetImage(
                                                'images/google_logo.png'),
                                          ),
                                        ),
                                        Text(
                                          "Login with Google",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                // Signup page link.
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 12, bottom: 5, left: 3, right: 3),
                                  child: RichText(
                                    text: TextSpan(children: [
                                      const TextSpan(
                                        style: TextStyle(color: Colors.grey),
                                        text: "Don't have an account? ",
                                      ),
                                      TextSpan(
                                          text: "Create one.",
                                          style: const TextStyle(
                                            color: Color(0xff0165fe),
                                            decoration:
                                                TextDecoration.underline,
                                          ),
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () {
                                              // UserSharedPreferences.setStatus(true);
                                              Navigator.pushNamed(
                                                  context, SignupScreen.id);
                                            })
                                    ]),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}
