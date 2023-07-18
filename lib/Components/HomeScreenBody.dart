import 'package:tournament_organizer/Screens/CreateTournamentScreen.dart';
import 'package:tournament_organizer/Screens/Dashboard.dart';
import 'package:tournament_organizer/Screens/ProfileScreen.dart';
import '../Screens/LoadingScreen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreenBody extends StatefulWidget {
  static String id = "HomeScreenBody";
  int _selectedIndex = 1;
  HomeScreenBody({super.key});

  @override
  _HomeScreenBodyState createState() => _HomeScreenBodyState();
}

class _HomeScreenBodyState extends State<HomeScreenBody> {
  late List<Widget> _pages;
  late PageController _pageController;

  @override
  void initState() {
    _pages = [
      const LoadingScreen(),
      Dashboard(),
      ProfileScreen(),
    ];
    _pageController = PageController(initialPage: widget._selectedIndex);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: _pages,
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            widget._selectedIndex = index;
          });
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.camera_alt),
            label: 'Camera',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble_outline_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.group_rounded),
            label: 'Profile',
          ),
        ],
        currentIndex: widget._selectedIndex,
        selectedItemColor: const Color(0xff3872b7),
        onTap: (int index) {
          setState(() {
            widget._selectedIndex = index;
            _pageController.jumpToPage(widget._selectedIndex);
          });
        },
      ),
    );
  }
}
