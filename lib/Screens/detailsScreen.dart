//import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shop/const/colors.dart';
import 'package:shop/data.dart';
import 'package:shop/widgets/shopdetails.dart';
//import 'package:signup/Const/colors.dart';


class DetailesScreen extends StatelessWidget {
  const DetailesScreen({super.key, required this.category});
  final String category;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
       body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: gradientBackGround,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ), child : Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              children: dataShops.where((e) => e.category==category).map((e) => 
            ShopDetail(category: e,)
              ).toList()
            ),
            
          )
        
      ));
    
  }
}