import 'package:flutter/material.dart';

class customAlertDialogue extends StatelessWidget {
  customAlertDialogue(
      {Key? key,
      required this.title,
      required this.subtitle,
      required this.actionButtonText})
      : super(key: key);

  String title;
  String subtitle;
  String actionButtonText;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(subtitle),
      actions: <Widget>[
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(actionButtonText))
      ],
    );
  }
}
