import 'package:shop/models/shops.dart';
import 'package:flutter/material.dart';

class Shoptypes extends StatelessWidget {
  const Shoptypes({super.key, required this.category});
  final Shops category;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        width: 150,
        height: 150,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20)),
        child: Column(
          children: [
            Image.asset(category.image),
            Text(
              category.category,
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
