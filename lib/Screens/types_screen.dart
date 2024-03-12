import 'package:shop/constants/colors.dart';
import 'package:shop/data.dart';
import 'package:shop/screens/settings.dart';
import 'package:shop/widgets/grid.dart';
import 'package:flutter/material.dart';

class TypesScreen extends StatefulWidget {
  const TypesScreen({super.key});

  @override
  State<TypesScreen> createState() => __TypesScreenState();
}

class __TypesScreenState extends State<TypesScreen> {
  List<String> filteredData = [];

  @override
  void initState() {
    var categories = dataShops.map((e) => e.category).toList();
    var categoriesSet = categories.toSet();

    filteredData = categoriesSet.toList();
    super.initState();
  }

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
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: GridView(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                  ),
                  // Wrap your items with shrinkWrap: true if you want the GridView to occupy only the space it needs
                  // shrinkWrap: true,
                  children: filteredData
                      .map(
                        (e) => HomeGrid(category: e),
                      )
                      .toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
