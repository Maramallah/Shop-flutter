import 'package:shop/data.dart';
import 'package:shop/screens/details_screen.dart';
import 'package:flutter/material.dart';

class HomeGrid extends StatefulWidget {
  const HomeGrid({super.key, required this.category});
  final String category;

  @override
  State<HomeGrid> createState() => _HomeGridState();
}

class _HomeGridState extends State<HomeGrid> {
  List<String> images = [];
  @override
  void initState() {
    Set<String> imagesSet = dataShops
        .where((e) => e.category == widget.category)
        .map((e) => e.image)
        .toSet();
    images = imagesSet.toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (ctx) => DetailesScreen(category: widget.category)));
      },
      child: Container(
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
        ),
        child: Column(
          children: [
            SizedBox(width: 110, height: 100, child: Image.asset(images[0])),
            const SizedBox(
              height: 25,
            ),
            Text(
              widget.category,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
