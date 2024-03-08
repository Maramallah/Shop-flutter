import 'package:flutter/material.dart';
import 'package:shop/model/Shop.dart';

class ShopDetail extends StatelessWidget {
  const ShopDetail({super.key, required this.category});
  final Shops category;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        width: 150,
        height: 150,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20)
        ),
        child: Column(
          children: [
            Text(category.name , style: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold
            ),
            ),
             Text(category.rating.toString() , style: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold
            ),
            ),
             Text(category.branches.toString() , style: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold
            ),
            ),
          ],
        ),
      ),
    );
      
  }
}