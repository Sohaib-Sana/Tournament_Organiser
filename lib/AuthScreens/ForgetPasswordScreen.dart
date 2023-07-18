import 'package:flutter/material.dart';
import 'package:tournament_organizer/AuthScreens/ResetPasswordScreen.dart';
import 'package:tournament_organizer/AuthScreensComponents/AuthButtons.dart';
import 'package:tournament_organizer/Screens/LoadingScreen.dart';
// import 'package:tournament_organizer/UserSharedPreferences.dart';

class ForgetPasswordScreen extends StatefulWidget {
  static String id = 'ForgetPasswordScreen';
  const ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  late String _email;
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
                      // Forget Password Heading.
                      const Text(
                        "Forget",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Alkatra'),
                      ),
                      const Text(
                        "Password?",
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
                          // Email TextField.
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
                                _email =
                                    value.replaceAll(" ", "").toLowerCase();
                              },
                            ),
                          ),

                          const SizedBox(height: 20),
                          // Submiit Button.
                          customAuthButton(
                            onTap: () async {
                              setState(() {
                                isLoading = true;
                              });
                              try {
                                Navigator.pushNamed(
                                        context, ResetPasswordScreen.id)
                                    .then((value) => setState(() {
                                          isLoading = false;
                                        }));
                              } catch (e) {
                                setState(() {
                                  isLoading = false;
                                });
                                print(
                                    "Check Submit Button implementation."); // TODO : Alert of error.
                              }
                            },
                            text: "Submit",
                            color: const Color(0xff0165fe),
                            width: (deviceWidth / 2) * 1.4,
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
