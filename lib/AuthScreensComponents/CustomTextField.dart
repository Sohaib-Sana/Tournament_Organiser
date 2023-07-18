import 'package:flutter/material.dart';

class customTextField extends StatelessWidget {
  customTextField({Key? key, required this.customChild}) : super(key: key);
  Widget customChild;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.black38,
        boxShadow: const [
          BoxShadow(
            offset: Offset(0, -4),
            blurRadius: 5,
            color: Colors.black26,
          ),
        ],
      ),
      child: customChild,
    );
  }
}
