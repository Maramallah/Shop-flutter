import 'package:shop/models/shops.dart';
import 'package:flutter/material.dart';

class ShopDetail extends StatelessWidget {
  const ShopDetail({super.key, required this.category});
  final Shops category;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white.withOpacity(.1),
      child: Container(
        width: 150,
        height: 150,
        decoration: BoxDecoration(
            color: Colors.white.withOpacity(.5), borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             
              Text(

                category.name,
                style:
                    const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 13,
              ),
              Row(
                children: [
                  const Icon(Icons.star),
                  Text(
                    'Rating : ${category.rating.toString()}',
                    style:
                        const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  const Icon(Icons.location_pin,),
                  Text(
                    category.branches.toString(),
                    style:
                        const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
