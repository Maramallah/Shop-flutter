import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color backGroundColor;
  final Color foreGroundColor;
  final Color borderSideColor;
  final double borderWidth;
  final VoidCallback onPressed;
  final IconData icon;

  const CustomButton(
      {super.key,
      required this.text,
      required this.backGroundColor,
      required this.foreGroundColor,
      required this.borderSideColor,
      required this.borderWidth,
      required this.onPressed,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(
        icon,
        size: 30,
      ),
      label: Text(
        text,
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: MediaQuery.of(context).size.width * 0.04),
      ),
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(15),
        backgroundColor: backGroundColor,
        foregroundColor: foreGroundColor,
        side: BorderSide(color: borderSideColor, width: borderWidth),
      ),
    );
  }
}
