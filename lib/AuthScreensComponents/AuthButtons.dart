import 'package:flutter/material.dart';

class customAuthButton extends StatelessWidget {
  customAuthButton(
      {Key? key,
      required this.text,
      required this.color,
      this.width,
      this.textColor,
      required this.onTap})
      : super(key: key);
  String text;
  Color color;
  double? width;
  Color? textColor;
  VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width ?? 125,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: color,
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  blurRadius: 1.5,
                  offset: const Offset(0, 3)),
            ]),
        margin: const EdgeInsets.only(top: 20),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18, color: textColor ?? Colors.white),
        ),
      ),
    );
  }
}
