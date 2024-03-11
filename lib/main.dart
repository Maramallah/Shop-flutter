import 'package:flutter/material.dart';
import 'package:shop/Screens/home_screen.dart';
import 'package:shop/Screens/profile.dart';
//import 'package:shop/Screens/typesscreen.dart';

void main() {
    runApp(const Start());
}
class Start extends StatelessWidget {
  const Start({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProfileScreen(),
      
    );
  }
}