import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:tournament_organizer/Screens/HomeScreen.dart';
import 'package:tournament_organizer/Screens/LoadingScreen.dart';
import 'package:tournament_organizer/Screens/UpdateProfileScreen.dart';
import '../Components/Profile_Strings.dart';
import '../AuthScreens/LoginScreen.dart';
import '../Components/ProifleMenuWidget.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfileScreen extends StatefulWidget {
  static String id = "ProfileScreen";
  ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  late String _name;
  late String _email;
  bool isLoading = false;

  void getMessages() async {
    setState(() {
      isLoading = true;
    });
    final docRef =
        await _firestore.collection("Users").doc(_auth.currentUser!.email);
    DocumentSnapshot doc = await docRef.get();
    final data = await doc.data() as Map<String, dynamic>;
    setState(() {
      _name = data['name'];
      _email = data['email'];
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    getMessages();
  }

  @override
  Widget build(BuildContext context) {
    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Scaffold(
      body: isLoading
          ? LoadingScreen()
          : SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(30),
                child: Column(
                  children: [
                    /// -- IMAGE
                    Stack(
                      children: [
                        SizedBox(
                          width: 120,
                          height: 120,
                          child: CircleAvatar(
                            radius: 50,
                            child: Image(
                              image: AssetImage("images/solo-removebg.png"),
                            ),
                            backgroundColor: Colors.grey.withOpacity(0.3),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            width: 35,
                            height: 35,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color:
                                    const Color(0xff0165fe).withOpacity(0.8)),
                            child: const Icon(
                              Icons.camera_alt,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),

                    /// -- NAME
                    Text(
                      _name,
                      style: TextStyle(color: Colors.black, fontSize: 25),
                    ),

                    /// --Email
                    Text(
                      _email,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 20),
                    const Divider(
                      color: Colors.black,
                      thickness: 1,
                    ),

                    ProfileMenuWidget(
                        title: "About",
                        icon: Icons.info_outline,
                        onPress: () {
                          Navigator.pushNamed(context, UpdateProfileScreen.id);
                        }),
                    ProfileMenuWidget(
                        title: "Notifications",
                        icon: Icons.notification_add,
                        onPress: () {}),
                    ProfileMenuWidget(
                        title: "App Language",
                        icon: Icons.language,
                        onPress: () {}),
                    ProfileMenuWidget(
                        title: "Help", icon: Icons.help, onPress: () {}),

                    const SizedBox(height: 20),
                    const Divider(
                      color: Colors.black,
                      thickness: 1,
                    ),

                    /// -- BUTTON
                    ProfileMenuWidget(
                        title: "Logout",
                        icon: Icons.logout,
                        textColor: Colors.red,
                        endIcon: false,
                        onPress: () {
                          _auth.signOut().then((_) {
                            GoogleSignIn().signOut();
                            Navigator.popAndPushNamed(context, LoginScreen.id);
                          });
                        }),
                  ],
                ),
              ),
            ),
    );
  }
}
