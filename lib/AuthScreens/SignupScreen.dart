// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:tournament_organizer/AuthScreensComponents/AuthButtons.dart';
import 'package:tournament_organizer/Screens/Dashboard.dart';
import 'package:tournament_organizer/Screens/HomeScreen.dart';
import 'package:tournament_organizer/Screens/LoadingScreen.dart';
import 'LoginScreen.dart';
import 'TermsAndPoliciesScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignupScreen extends StatefulWidget {
  static String id = 'SignupScreen';
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String? _name;
  late String _email;
  late String _password;
  String? _phone;
  // late String userId;
  bool isPasswordVisible = true;
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
                padding: const EdgeInsets.all(25),
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
                          height: deviceHeight / 3,
                          image: const AssetImage('images/4259273.jpg'),
                        ),
                      ),
                      // Login Heading.
                      const Text(
                        "Sign up",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Alkatra'),
                      ),
                      const SizedBox(
                        height: 25,
                      ),

                      // This column contains email text field to Create account textField.
                      Column(
                        children: <Widget>[
                          const SizedBox(height: 20),

                          /// Name TextField
                          Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            child: TextField(
                              textAlign: TextAlign.start,
                              keyboardType: TextInputType.name,
                              style: TextStyle(color: Colors.black54),
                              decoration: const InputDecoration(
                                icon: Icon(Icons.person),
                                iconColor: textAndIconsColor,
                                hintText: "Enter your Name.",
                                hintStyle: TextStyle(color: textAndIconsColor),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 2, color: textAndIconsColor),
                                ),
                              ),
                              onChanged: (value) {
                                this._name = value.toString();
                                //replaceAll(" ", "").toLowerCase()
                              },
                            ),
                          ),

                          /// Email TextField.
                          Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            child: TextField(
                              textAlign: TextAlign.start,
                              keyboardType: TextInputType.emailAddress,
                              style: TextStyle(color: Colors.black54),
                              decoration: const InputDecoration(
                                icon: Icon(Icons.alternate_email),
                                iconColor: textAndIconsColor,
                                hintText: "Enter your Email.",
                                hintStyle: TextStyle(color: textAndIconsColor),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 2, color: textAndIconsColor),
                                ),
                              ),
                              onChanged: (value) {
                                this._email = value.toString();
                                //replaceAll(" ", "").toLowerCase()
                              },
                            ),
                          ),

                          /// Password TextField
                          Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20),
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
                                    setState(
                                      () {
                                        isPasswordVisible = !isPasswordVisible;
                                      },
                                    )
                                  },
                                ),
                                suffixIconColor: textAndIconsColor,
                                hintText: "Enter your Password.",
                                hintStyle: TextStyle(color: textAndIconsColor),
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

                          /// Mobile Phone TextField
                          Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            child: TextField(
                              textAlign: TextAlign.start,
                              keyboardType: TextInputType.phone,
                              style: TextStyle(color: Colors.black54),
                              decoration: const InputDecoration(
                                icon: Icon(Icons.phone_outlined),
                                iconColor: textAndIconsColor,
                                hintText: "Enter your Phone Number.",
                                hintStyle: TextStyle(color: textAndIconsColor),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 2, color: textAndIconsColor),
                                ),
                              ),
                              onChanged: (value) {
                                _phone = value;
                              },
                            ),
                          ),
                          const SizedBox(height: 20),

                          /// Terms and Conditions text
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 12, bottom: 5, left: 3, right: 3),
                            child: RichText(
                              text: TextSpan(children: [
                                const TextSpan(
                                  style: TextStyle(color: Colors.grey),
                                  text: "By Signing up, you are agree to our ",
                                ),
                                TextSpan(
                                    text: "Terms and conditoins ",
                                    style: const TextStyle(
                                      color: Color(0xff0165fe),
                                      decoration: TextDecoration.underline,
                                    ),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        // UserSharedPreferences.setStatus(true);
                                        Navigator.pushNamed(
                                            context, TermsAndPoliciesScreen.id);
                                      }),
                                const TextSpan(
                                  style: TextStyle(color: Colors.grey),
                                  text: "and ",
                                ),
                                TextSpan(
                                    text: "Privacy Policy",
                                    style: const TextStyle(
                                      color: Color(0xff0165fe),
                                      decoration: TextDecoration.underline,
                                    ),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        // UserSharedPreferences.setStatus(true);
                                        Navigator.pushNamed(
                                            context, TermsAndPoliciesScreen.id);
                                      }),
                              ]),
                            ),
                          ),

                          ///--- Login Button.
                          customAuthButton(
                            onTap: () async {
                              setState(() {
                                isLoading = true;
                              });
                              if (_name == null || _phone == null) {
                                setState(() {
                                  isLoading = false;
                                });
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text(
                                            "Please Fill our All fields.")));
                              } else {
                                try {
                                  final user = await _auth
                                      .createUserWithEmailAndPassword(
                                          email: _email, password: _password);
                                  await _firestore
                                      .collection('Users')
                                      .doc(user.user!.email)
                                      .set({
                                    'name': _name,
                                    'email': _email,
                                    'phone': _phone
                                  });
                                  Navigator.popAndPushNamed(
                                      context, HomeScreen.id);
                                } catch (e) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(content: Text(e.toString())));
                                }
                              }
                            },
                            text: "Sign up",
                            color: const Color(0xff0165fe),
                            width: (deviceWidth / 2) * 1.4,
                          ),
                          // Signup page link.
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 12, bottom: 5, left: 3, right: 3),
                            child: RichText(
                              text: TextSpan(children: [
                                const TextSpan(
                                  style: TextStyle(color: Colors.grey),
                                  text: "Already have an account? ",
                                ),
                                TextSpan(
                                    text: "Sign in ",
                                    style: const TextStyle(
                                      color: Color(0xff0165fe),
                                      decoration: TextDecoration.underline,
                                    ),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        // UserSharedPreferences.setStatus(true);
                                        Navigator.popAndPushNamed(
                                            context, LoginScreen.id);
                                      })
                              ]),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}
