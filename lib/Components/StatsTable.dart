import 'package:flutter/material.dart';

class StatsTable extends StatelessWidget {
  const StatsTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(children: <Widget>[
      Container(
        margin: EdgeInsets.all(20),
        child: Table(
          columnWidths: {
            0: FlexColumnWidth(3),
            4: FlexColumnWidth(2),
          },
          border: TableBorder.all(
            color: Colors.black,
            style: BorderStyle.solid,
            width: 1,
          ),
          children: [
            TableRow(children: [
              Column(
                  children: [Text('Team', style: TextStyle(fontSize: 20.0))]),
              Column(children: [Text('P', style: TextStyle(fontSize: 20.0))]),
              Column(children: [Text('W', style: TextStyle(fontSize: 20.0))]),
              Column(children: [Text('L', style: TextStyle(fontSize: 20.0))]),
              Column(
                  children: [Text('Point', style: TextStyle(fontSize: 20.0))]),
            ]),
            TableRow(children: [
              Column(children: [Text('Dolphin')]),
              Column(children: [Text('3')]),
              Column(children: [Text('1')]),
              Column(children: [Text('2')]),
              Column(children: [Text('-2')]),
            ]),
            TableRow(children: [
              Column(children: [Text('Gladiators')]),
              Column(children: [Text('5')]),
              Column(children: [Text('1')]),
              Column(children: [Text('4')]),
              Column(children: [Text('-6')]),
            ]),
            TableRow(children: [
              Column(children: [Text('Eagle')]),
              Column(children: [Text('4')]),
              Column(children: [Text('3')]),
              Column(children: [Text('1')]),
              Column(children: [Text('4')]),
            ]),
            TableRow(children: [
              Column(children: [Text('Lions')]),
              Column(children: [Text('5')]),
              Column(children: [Text('3')]),
              Column(children: [Text('2')]),
              Column(children: [Text('2')]),
            ]),
            TableRow(children: [
              Column(children: [Text('Electricians')]),
              Column(children: [Text('5')]),
              Column(children: [Text('2')]),
              Column(children: [Text('3')]),
              Column(children: [Text('-2')]),
            ]),
            TableRow(children: [
              Column(children: [Text('Flashers')]),
              Column(children: [Text('6')]),
              Column(children: [Text('3')]),
              Column(children: [Text('3')]),
              Column(children: [Text('0')]),
            ]),
          ],
        ),
      ),
    ]));
  }
}
