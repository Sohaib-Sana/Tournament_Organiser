import 'package:flutter/material.dart';

class ActiveTournamentCard extends StatefulWidget {
  ActiveTournamentCard(
      {Key? key, this.tournamentIcon, required this.name, this.description})
      : super(key: key);
  Image? tournamentIcon;
  String name;
  String? description;

  @override
  State<ActiveTournamentCard> createState() => _ActiveTournamentCardState();
}

class _ActiveTournamentCardState extends State<ActiveTournamentCard> {
  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    return Container(
      height: deviceHeight * 0.16,
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
              margin: const EdgeInsets.all(12),
              child: CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: deviceWidth * 0.12,
                backgroundImage: widget.tournamentIcon?.image ??
                    const AssetImage('images/splashScreenImage.png'),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: deviceWidth * 0.5,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                    child: Text(
                      widget.name,
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: deviceWidth * 0.5,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(5, 10, 0, 0),
                    child: Text(
                      widget.description ?? "No Description.",
                      style: TextStyle(fontSize: 12, color: Colors.black45),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
