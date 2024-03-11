import 'package:flutter/material.dart';
import 'package:shop/const/colors.dart';
import 'package:shop/data.dart';
import 'package:shop/widgets/Grid.dart';

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

        child:Column(
          children: [
              AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              toolbarHeight: 10,
            ),
             Padding(
          padding: const EdgeInsets.all(10.0),
          child: GridView(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
            ),
            children: filteredData
                .map(
                  (e) => HomeGrid(
                    category: e
                  ),
                )
                .toList(),
          ),
        ),

          ],
        )
        
      ),
    );
  }
}
