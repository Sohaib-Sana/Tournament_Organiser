import 'package:flutter/material.dart';
import 'package:flutter_lorem/flutter_lorem.dart';

class TermsAndPoliciesScreen extends StatelessWidget {
  static String id = "TermsAndPoliciesScreen";
  const TermsAndPoliciesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.only(top: 8, left: 8, right: 8),
        color: Colors.white,
        child: Center(
          child: Text(
            lorem(paragraphs: 4, words: 200),
            style: const TextStyle(
                fontFamily: 'Alkatra',
                fontSize: 20,
                color: Colors.grey,
                decoration: TextDecoration.none),
          ),
        ),
      ),
    );
  }
}
