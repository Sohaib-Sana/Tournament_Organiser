import 'dart:async';
import 'package:flutter/material.dart';
import 'package:tournament_organizer/AuthScreens/SignupScreen.dart';
import 'package:tournament_organizer/Screens/HomeScreen.dart';
import '../UserSharedPreferences.dart';

import '../AuthScreens/LoginScreen.dart';

class SplashScreen extends StatefulWidget {
  static String id = 'SplashScreen';
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    startTimer();
    super.initState();
  }

  void startTimer() {
    Timer(const Duration(seconds: 3), () {
      Navigator.popAndPushNamed(context, LoginScreen.id);
      // navigateUser();
    });
  }

  void navigateUser() {
    bool hasStatusKey = UserSharedPreferences.prefs.containsKey('status');
    if (hasStatusKey) {
      bool? status = UserSharedPreferences.getStatus();
      if (status != null) {
        if (status) {
          Navigator.popAndPushNamed(context, HomeScreen.id);
        } else {
          Navigator.popAndPushNamed(context, LoginScreen.id);
        }
      }
    } else {
      Navigator.popAndPushNamed(context, SignupScreen.id);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            blurRadius: 4,
            offset: const Offset(4, 8), // Shadow position
          ),
        ],
        image: const DecorationImage(
          image: AssetImage('images/splashScreenImage.png'),
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
