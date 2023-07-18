import 'package:flutter/material.dart';
import 'package:tournament_organizer/Components/ActiveTournamentCards.dart';
import 'package:tournament_organizer/Components/CompletedTournamentCards.dart';
import 'package:tournament_organizer/Screens/CompletedTournamentDetailsScreen.dart';
import 'package:tournament_organizer/Screens/CreateTournamentScreen.dart';
import 'package:tournament_organizer/Screens/ProfileScreen.dart';
import 'package:tournament_organizer/Screens/ActiveTournamentDetailsScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Dashboard extends StatelessWidget {
  static String id = "Dashboard";
  final _auth = FirebaseAuth.instance;
  User? _loggedInUser;
  Dashboard({Key? key}) : super(key: key);

  getCurrentUser() async {
    try {
      final user = await _auth.currentUser;
      if (user != null) {
        _loggedInUser = user;
      }
    } catch (e) {
      print("Internet Connection Error.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: const Drawer(),
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.pushNamed(context, CreateTournament.id);
        },
        label: const Text("Create"),
        icon: const Icon(Icons.add),
        backgroundColor: const Color(0xff3872b7),
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            /// Active Tournaments.
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0.0),
              ),
              color: Colors.white70,
              elevation: 10,
              child: Column(
                children: <Widget>[
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Active Tournaments",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.green,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                          context, ActiveTournamentDetailsScreen.id);
                    },
                    child: ActiveTournamentCard(
                      name: "Inter Departmental",
                      description:
                          "Inter Departmental Tournament in COMSATS University Islamabad, Attock Campus",
                      tournamentIcon: Image.asset('images/SmashSolo.png'),
                    ),
                  ),
                  ActiveTournamentCard(
                    name: "CS Tournament",
                    description:
                        "Random Participants from whole University in COMSATS University Islamabad, Attock Campus",
                    tournamentIcon: Image.asset('images/Sweating.png'),
                  ),
                  ActiveTournamentCard(
                    name: "Annual Trophy",
                    description:
                        "Annual Trophy Tournament inter departmental in COMSATS University Islamabad, Attock Campus",
                    tournamentIcon: Image.asset('images/tournament.png'),
                  ),
                ],
              ),
            ),

            /// Completed Tournaments
            Card(
              margin: const EdgeInsets.all(4),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0.0),
              ),
              color: Colors.white70,
              elevation: 10,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Completed Tournaments",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.red,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                                context, CompletedTournamentDetailsScreen.id);
                          },
                          child: CompletedTournamentCards(
                            name: "Inter Departmental",
                            description:
                                "Inter Departmental Tournament in COMSATS University Islamabad, Attock Campus",
                            tournamentIcon:
                                Image.asset('images/solo-removebg.png'),
                          ),
                        ),
                        CompletedTournamentCards(
                          name: "CS Tournament",
                          description:
                              "Random Participants from whole University in COMSATS University Islamabad, Attock Campus",
                          tournamentIcon:
                              Image.asset('images/childplaying.png'),
                        ),
                        CompletedTournamentCards(
                          name: "Annual Trophy",
                          description:
                              "Annual Trophy Tournament inter departmental in COMSATS University Islamabad, Attock Campus",
                          tournamentIcon: Image.asset('images/tournament.png'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
