// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color BackgroundColor;
  final Color ForeGroundColor;
  final Color BorderSideColor;
  final double BorderWidth;
  final VoidCallback onPressed;
  final IconData icon;

  const CustomButton(
      {super.key,
      required this.text,
      required this.BackgroundColor,
      required this.ForeGroundColor,
      required this.BorderSideColor,
      required this.BorderWidth,
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
        backgroundColor: BackgroundColor,
        foregroundColor: ForeGroundColor,
        side: BorderSide(color: BorderSideColor, width: BorderWidth),
      ),
    );
  }
}
