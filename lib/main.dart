import 'package:flutter/material.dart';
import 'package:tournament_organizer/AuthScreens/ForgetPasswordScreen.dart';
import 'package:tournament_organizer/AuthScreens/ResetPasswordScreen.dart';
import 'package:tournament_organizer/AuthScreens/TermsAndPoliciesScreen.dart';
import 'package:tournament_organizer/Screens/CompletedTournamentDetailsScreen.dart';
import 'package:tournament_organizer/Screens/HomeScreen.dart';
import 'package:tournament_organizer/Screens/CreateTournamentScreen.dart';
import 'package:tournament_organizer/Screens/Dashboard.dart';
import 'package:tournament_organizer/Screens/ProfileScreen.dart';
import 'package:tournament_organizer/Screens/SplashScreen.dart';
import 'package:tournament_organizer/Screens/ActiveTournamentDetailsScreen.dart';
import 'package:tournament_organizer/Screens/UpdateProfileScreen.dart';
import 'AuthScreens/SignupScreen.dart';
import 'AuthScreens/LoginScreen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // await UserSharedPreferences.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(
        textTheme: const TextTheme(
          headlineMedium: TextStyle(color: Colors.black),
          bodyMedium: TextStyle(color: Colors.black, fontSize: 12),
        ),
      ),
      darkTheme: ThemeData(
        primaryColor: const Color(0xff3872b7),
        textTheme: const TextTheme(
          headlineMedium: TextStyle(color: Colors.white, fontSize: 25),
          bodyMedium: TextStyle(color: Colors.black, fontSize: 12),
        ),
      ),
      initialRoute: SplashScreen.id,
      routes: {
        SignupScreen.id: (context) => const SignupScreen(),
        LoginScreen.id: (context) => const LoginScreen(),
        TermsAndPoliciesScreen.id: (context) => const TermsAndPoliciesScreen(),
        ResetPasswordScreen.id: (context) => const ResetPasswordScreen(),
        ForgetPasswordScreen.id: (context) => const ForgetPasswordScreen(),
        SplashScreen.id: (context) => const SplashScreen(),
        Dashboard.id: (context) => Dashboard(),
        ActiveTournamentDetailsScreen.id: (context) =>
            const ActiveTournamentDetailsScreen(),
        CompletedTournamentDetailsScreen.id: (context) =>
            const CompletedTournamentDetailsScreen(),
        ProfileScreen.id: (context) => ProfileScreen(),
        UpdateProfileScreen.id: (context) => UpdateProfileScreen(),
        CreateTournament.id: (context) => const CreateTournament(),
        HomeScreen.id: (context) => HomeScreen(),
      },
    );
  }
}
