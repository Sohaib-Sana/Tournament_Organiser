import 'package:flutter/material.dart';
import 'package:tournament_organizer/Components/HomeScreenBody.dart';
import 'package:tournament_organizer/Screens/ProfileScreen.dart';

class HomeScreen extends StatelessWidget {
  static String id = 'HomeScreen';

  HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff3872b7),
        leading: Image(
          image: AssetImage('images/splashScreenImage.png'),
        ),
        // toolbarHeight: 50,
        title: const Text(
          "SMART ORGANIZER",
          style: TextStyle(color: Colors.white, fontSize: 19),
        ),
        actions: [
          IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                //TODO:Implement Search Tournament functionality.
              }),
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              Navigator.pushNamed(context, ProfileScreen.id);
            },
          ),
        ],
      ),
      body: HomeScreenBody(),
    );
  }
}
