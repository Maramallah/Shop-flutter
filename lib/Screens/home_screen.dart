import 'package:flutter/material.dart';
import 'package:shop/constants/colors.dart';
import 'package:shop/screens/auth_screen.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Alignment> _topAlignmentAnimation;
  late Animation<Alignment> _bottomAlignmentAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 15),
      vsync: this,
    );
    _topAlignmentAnimation = TweenSequence<Alignment>(
      [
        TweenSequenceItem<Alignment>(
          tween: Tween<Alignment>(begin: Alignment.topLeft, end: Alignment.topRight)
              .chain(CurveTween(curve: Curves.easeInOut)),
          weight: 1,
        ),
        TweenSequenceItem(
          tween: Tween<Alignment>(begin: Alignment.topRight, end: Alignment.bottomRight)
              .chain(CurveTween(curve: Curves.easeInOut)),
          weight: 2,
        ),
        TweenSequenceItem(
          tween: Tween<Alignment>(begin: Alignment.bottomRight, end: Alignment.bottomLeft)
              .chain(CurveTween(curve: Curves.easeInOut)),
          weight: 1,
        ),
        TweenSequenceItem(
          tween: Tween<Alignment>(begin: Alignment.bottomLeft, end: Alignment.topLeft)
              .chain(CurveTween(curve: Curves.easeInOut)),
          weight: 2,
        ),
      ],
    ).animate(_controller);
    _bottomAlignmentAnimation = TweenSequence<Alignment>(
      [
        TweenSequenceItem(
          tween: Tween<Alignment>(begin: Alignment.bottomRight, end: Alignment.bottomLeft)
              .chain(CurveTween(curve: Curves.easeInOut)),
          weight: 1,
        ),
        TweenSequenceItem(
          tween: Tween<Alignment>(begin: Alignment.bottomLeft, end: Alignment.topLeft)
              .chain(CurveTween(curve: Curves.easeInOut)),
          weight: 2,
        ),
        TweenSequenceItem(
          tween: Tween<Alignment>(begin: Alignment.topLeft, end: Alignment.topRight)
              .chain(CurveTween(curve: Curves.easeInOut)),
          weight: 1,
        ),
        TweenSequenceItem(
          tween: Tween<Alignment>(begin: Alignment.topRight, end: Alignment.bottomRight)
              .chain(CurveTween(curve: Curves.easeInOut)),
          weight: 2,
        ),
      ],
    ).animate(_controller);
    _controller.repeat(reverse: true);
    _controller.forward();
  }
   @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
        animation: _controller,
        builder: (context, _) {
          return Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: gradientBackGround,
                begin: _topAlignmentAnimation.value,
                end: _bottomAlignmentAnimation.value,
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(13.0),
                    child: Text("Brands and new Styles", style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold, color: Colors.white)),
                  ),
                  const SizedBox(height: 80.0),
                  const Text(
                    "let's start to browse and purchase the\nlatest fashion brands and styles.",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500 ,color: Colors.white),
                  ),
                  const SizedBox(height:40),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton(
                          onPressed: () {Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const AuthScreen(
                      isLogin: false,
                    ),
                  ),
                );},
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white, backgroundColor: Color.fromARGB(255, 115, 124, 220).withOpacity(.5),
                            fixedSize: const Size(250, 45),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              side: const BorderSide(color: Color.fromARGB(255, 195, 191, 212)),
                            ),
                          ),
                          child: const Text("Register", style: TextStyle(fontSize: 20)),
                        ),
                        const SizedBox(height: 20.0),
                        ElevatedButton(
                          onPressed: () {    Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const AuthScreen(
                      isLogin: true,
                    ),
                  ),
                );},
                          style: ElevatedButton.styleFrom(
                           foregroundColor: Colors.white, backgroundColor: Color.fromARGB(255, 115, 124, 220).withOpacity(.5),
                            fixedSize: const Size(250, 45),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              side: const BorderSide(color:  Color.fromARGB(255, 195, 191, 212)),
                            ),
                          ),
                          child: const Text("Login", style: TextStyle(fontSize: 22)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
