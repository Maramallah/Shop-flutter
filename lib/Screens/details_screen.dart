import 'package:shop/constants/colors.dart';
import 'package:shop/data.dart';
import 'package:shop/screens/settings.dart';
import 'package:shop/widgets/shop_details.dart';
import 'package:flutter/material.dart';

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
        ),
        child: Column(
          children: [
            AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              toolbarHeight: 40,
              actions: [
                IconButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (ctx) => const Settings(),
                        ),
                      );
                    },
                    icon: const Icon(Icons.settings))
              ],
            ),
            Expanded(
              // Wrap ListView with Expanded
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView(
                  children: dataShops
                      .where((e) => e.category == category)
                      .map((e) => ShopDetail(
                            category: e,
                          ))
                      .toList(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
