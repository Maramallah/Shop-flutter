import 'package:shop/widgets/login_widget.dart';
import 'package:shop/widgets/register_widget.dart';
import 'package:flutter/material.dart';
import 'package:shop/constants/colors.dart';
import 'package:flutter/widgets.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key, required this.isLogin});

  final bool isLogin;

  @override
  AuthScreenState createState() => AuthScreenState();
}

class AuthScreenState extends State<AuthScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Alignment> _topAlignmentAnimation;
  late Animation<Alignment> _bottomAlignmentAnimation;

  bool isLogin = false;
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
          tween: Tween<Alignment>(
                  begin: Alignment.topLeft, end: Alignment.topRight)
              .chain(CurveTween(curve: Curves.easeInOut)),
          weight: 1,
        ),
        TweenSequenceItem(
            tween: Tween<Alignment>(
                    begin: Alignment.topRight, end: Alignment.bottomRight)
                .chain(CurveTween(curve: Curves.easeInOut)),
            weight: 2),
        TweenSequenceItem(
            tween: Tween<Alignment>(
                    begin: Alignment.bottomRight, end: Alignment.bottomLeft)
                .chain(CurveTween(curve: Curves.easeInOut)),
            weight: 1),
        TweenSequenceItem(
            tween: Tween<Alignment>(
                    begin: Alignment.bottomLeft, end: Alignment.topLeft)
                .chain(CurveTween(curve: Curves.easeInOut)),
            weight: 2),
      ],
    ).animate(_controller);
    _bottomAlignmentAnimation = TweenSequence<Alignment>(
      [
        TweenSequenceItem(
            tween: Tween<Alignment>(
                    begin: Alignment.bottomRight, end: Alignment.bottomLeft)
                .chain(CurveTween(curve: Curves.easeInOut)),
            weight: 1),
        TweenSequenceItem(
            tween: Tween<Alignment>(
                    begin: Alignment.bottomLeft, end: Alignment.topLeft)
                .chain(CurveTween(curve: Curves.easeInOut)),
            weight: 2),
        TweenSequenceItem(
            tween: Tween<Alignment>(
                    begin: Alignment.topLeft, end: Alignment.topRight)
                .chain(CurveTween(curve: Curves.easeInOut)),
            weight: 1),
        TweenSequenceItem(
            tween: Tween<Alignment>(
                    begin: Alignment.topRight, end: Alignment.bottomRight)
                .chain(CurveTween(curve: Curves.easeInOut)),
            weight: 2),
      ],
    ).animate(_controller);
    _controller.repeat();
    isLogin = widget.isLogin;
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
                child: Container(
                  padding: const EdgeInsets.all(13),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.5),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  height: 600,
                  width: 350,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ClipOval(
                        child: Image.asset(
                          "assets/images/auth.png",
                          height: 90,
                          width: 90,
                        ),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      isLogin ? const LoginWidget() : const RegisterWidget(),
                      TextButton(
                        onPressed: () {
                          setState(
                            () {
                              isLogin = !isLogin;
                            },
                          );
                        },
                        child: isLogin
                            ? RichText(
                                text: TextSpan(
                                  text: "Don't have an account? ",
                                  style: DefaultTextStyle.of(context).style,
                                  children: const <TextSpan>[
                                    TextSpan(
                                      text: 'Register',
                                      style: TextStyle(
                                        color: Colors.pink,
                                        fontWeight: FontWeight.bold,
                                        decoration: TextDecoration.underline,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            : RichText(
                                text: TextSpan(
                                  text: "Already have an account? ",
                                  style: DefaultTextStyle.of(context).style,
                                  children: const <TextSpan>[
                                    TextSpan(
                                      text: 'Login',
                                      style: TextStyle(
                                        color: Colors.pink,
                                        fontWeight: FontWeight.bold,
                                        decoration: TextDecoration.underline,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
