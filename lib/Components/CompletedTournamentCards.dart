import 'package:flutter/material.dart';

class CompletedTournamentCards extends StatefulWidget {
  CompletedTournamentCards(
      {Key? key, this.tournamentIcon, required this.name, this.description})
      : super(key: key);
  Image? tournamentIcon;
  String name;
  String? description;

  @override
  State<CompletedTournamentCards> createState() =>
      _CompletedTournamentCardsState();
}

class _CompletedTournamentCardsState extends State<CompletedTournamentCards> {
  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    return Container(
      height: deviceHeight * 0.26,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0.2),
        ),
        color: Colors.white70,
        elevation: 10,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: deviceWidth * 0.5,
              alignment: Alignment.center,
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
              margin: const EdgeInsets.all(12),
              child: CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: deviceWidth * 0.12,
                backgroundImage: widget.tournamentIcon?.image ??
                    const AssetImage('images/splashScreenImage.png'),
              ),
            ),
            Container(
              width: deviceWidth * 0.45,
              child: Padding(
                padding: EdgeInsets.fromLTRB(5, 1, 0, 0),
                child: Text(
                  widget.description ?? "No Description.",
                  style: const TextStyle(
                      fontSize: 12,
                      color: Colors.black45,
                      overflow: TextOverflow.ellipsis),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
