import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:tournament_organizer/AuthScreensComponents/AuthButtons.dart';
import 'package:tournament_organizer/Screens/Dashboard.dart';
import 'package:tournament_organizer/Screens/LoadingScreen.dart';
import 'LoginScreen.dart';
// import 'package:tournament_organizer/UserSharedPreferences.dart';

class ResetPasswordScreen extends StatefulWidget {
  static String id = 'ResetPasswordScreen';
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  late String _email;
  late String _password;
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
                      // Reset Password Heading.
                      const Text(
                        "Reset",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Alkatra'),
                      ),
                      const Text(
                        "Password",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Alkatra'),
                      ),
                      const SizedBox(
                        height: 25,
                      ),

                      // This column contains email text field to Submit Button.
                      Column(
                        children: <Widget>[
                          const SizedBox(height: 20),
                          // New Password TextField
                          Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            child: TextField(
                              obscureText: true,
                              textAlign: TextAlign.start,
                              style: TextStyle(color: Colors.black54),
                              decoration: const InputDecoration(
                                icon: Icon(Icons.security_outlined),
                                iconColor: textAndIconsColor,
                                suffixIcon: Icon(Icons.remove_red_eye_sharp),
                                suffixIconColor: textAndIconsColor,
                                hintText: "Enter new password.",
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
                          // Re-enter Password Texfield.
                          Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            child: TextField(
                              obscureText: true,
                              textAlign: TextAlign.start,
                              style: TextStyle(color: Colors.black54),
                              decoration: const InputDecoration(
                                icon: Icon(Icons.security_outlined),
                                iconColor: textAndIconsColor,
                                suffixIcon: Icon(Icons.remove_red_eye_sharp),
                                suffixIconColor: textAndIconsColor,
                                hintText: "Re-enter password.",
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
                          const SizedBox(height: 20),
                          // Login Button.
                          customAuthButton(
                            onTap: () async {
                              setState(() {
                                isLoading = true;
                              });
                              try {
                                Navigator.pushNamed(context, Dashboard.id);
                              } catch (e) {
                                setState(() {
                                  isLoading = false;
                                });
                                print(
                                    "Check Login Button implementation."); // TODO : Alert of error.
                              }
                            },
                            text: "Submit",
                            color: const Color(0xff0165fe),
                            width: (deviceWidth / 2) * 1.4,
                          ),
                          // Login page link.
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 12, bottom: 5, left: 3, right: 3),
                            child: RichText(
                              text: TextSpan(children: [
                                const TextSpan(
                                  style: TextStyle(color: Colors.grey),
                                  text: "Remember your old password? ",
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
