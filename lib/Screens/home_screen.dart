
import 'package:flutter/material.dart';
import 'package:shop/const/colors.dart';

import 'package:shop/data.dart';
import 'package:shop/widgets/Grid.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> filtredData = [];

  @override
  void initState() {
    var categories = dataShops.map((e) => e.category).toList();
    var categoriesSet = categories.toSet();
    filtredData = categoriesSet.toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: violet,
        foregroundColor: white,
        title: const Text('Home'),
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.settings))
        ],
      ),
        backgroundColor: violet,
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: GridView(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
            ),
            children: filtredData
                .map(
                  (e) => HomeGrid(category: e,)
                )
                .toList(),
          ),
        ));
  }
}
