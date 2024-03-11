import 'package:flutter/material.dart';
import 'package:shop/const/colors.dart';
import 'package:shop/widgets/displayimage.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
              toolbarHeight: 10,
            ),
            const Center(
              child: Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: Text(
                  'Profile',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                    color: Color.fromRGBO(94, 35, 153, 1),
                  ),
                ),
              ),
            ),
            InkWell(
              child: DisplayImage(
                imagePath: 'assets/images/registier.jpg',
                onPressed: () {},
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  // borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildProfileItem('Name'),
                      buildDivider(),
                      buildProfileItem('Email'),
                      buildDivider(),
                      buildProfileItem('Basket'),
                      buildDivider(),
                      buildProfileItem('Password'),
                      buildDivider(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

   Widget buildProfileItem(String text) {
    return SizedBox(
      width: double.infinity,
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              text,
              style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
            ),
          ),
          const Icon(
            Icons.keyboard_arrow_right,
            color: Colors.grey,
            size: 40.0,
          ),
        ],
      ),
    );
  }
}
  Widget buildDivider() {
    return Container(
      width: double.infinity,
      height: 1,
      color: Colors.grey,
    );
  }

