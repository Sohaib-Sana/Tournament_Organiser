import 'package:flutter/material.dart';
import 'package:tournament_organizer/Components/StatsTable.dart';

class CompletedTournamentDetailsScreen extends StatefulWidget {
  static String id = 'CompletedTournamentDetailsScreen';
  const CompletedTournamentDetailsScreen({Key? key}) : super(key: key);

  @override
  State<CompletedTournamentDetailsScreen> createState() =>
      _CompletedTournamentDetailsScreenState();
}

class _CompletedTournamentDetailsScreenState
    extends State<CompletedTournamentDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    double _winProb = 70;
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xff3872b7),
        title: const Text("Tournament Statistics"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 8),
          child: Column(
            children: <Widget>[
              Container(
                height: deviceHeight * 0.25,
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0.0),
                  ),
                  color: Colors.white70,
                  elevation: 10,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.only(
                            top: 12, bottom: 12, left: 2, right: 12),
                        child: CircleAvatar(
                          backgroundColor: Colors.transparent,
                          radius: deviceWidth * 0.18,
                          backgroundImage:
                              const AssetImage('images/solo-removebg.png'),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            width: deviceWidth * 0.5,
                            child: const Padding(
                              padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                              child: Text(
                                "Inter Departmental",
                                style: TextStyle(
                                  color: Color(0xff0e47a0),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 21,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: deviceWidth * 0.5,
                            child: const Padding(
                                padding: EdgeInsets.fromLTRB(5, 10, 0, 0),
                                child: Text(
                                    "This Tournament is Organized by Head of Sports in COMSATS University Islamabad, Attock Campus.")),
                          ),
                          Container(
                            width: deviceWidth * 0.5,
                            child: const Padding(
                                padding: EdgeInsets.fromLTRB(5, 10, 0, 0),
                                child: Text("Organizer: Head of Sports")),
                          ),
                          Container(
                            width: deviceWidth * 0.5,
                            child: const Padding(
                                padding: EdgeInsets.fromLTRB(5, 2, 0, 0),
                                child: Text("Location:   CS Department")),
                          ),
                          Container(
                            width: deviceWidth * 0.5,
                            child: const Padding(
                                padding: EdgeInsets.fromLTRB(5, 2, 0, 0),
                                child: Text("Type:          Doubles")),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0.0),
                ),
                color: Colors.white70,
                elevation: 10,
                margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      const Text(
                        "Winners Of The Tournament",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 21,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            "Winners: Eagles",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                          Icon(Icons.emoji_events),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            "Runner Up: Lions",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                          Icon(Icons.emoji_events),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0.0),
                ),
                color: Colors.white70,
                elevation: 10,
                margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                child: Column(
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(top: 12.0, bottom: 2),
                      child: Text(
                        "Statistics",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(1.0),
                      child: StatsTable(),
                    ),
                  ],
                ),
              ),
              Container(
                height: deviceHeight * 0.45,
                width: deviceWidth * 0.98,
                margin: const EdgeInsets.symmetric(horizontal: 3, vertical: 5),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0.0),
                  ),
                  color: Colors.white70,
                  elevation: 10,
                  margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(
                          top: 8.0,
                        ),
                        child: Text(
                          "BRACKET",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Expanded(
                        child: Image.asset(
                          'images/TournamentBracket.png',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
