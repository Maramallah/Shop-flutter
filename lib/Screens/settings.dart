import 'dart:async';

import 'package:shop/constants/colors.dart';
import 'package:shop/models/accounts.dart';
import 'package:shop/screens/auth_screen.dart';
import 'package:shop/screens/home_screen.dart';
import 'package:shop/screens/profile_screen.dart';
import 'package:shop/widgets/exapansion_panel.dart';
import 'package:shop/widgets/customlevatedbutton.dart';
import 'package:shop/widgets/settings_feature.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:url_launcher/url_launcher.dart';

const int numberOfItemsintheExpansionPanel = 6;

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  double _currentSliderValue = 1.0;
  static const List<String> languageList = <String>[
    'English',
    'French',
    'Arabic'
  ];
  String dropdownValue = languageList.first;

  @override
  Widget build(BuildContext context) {
    return Consumer<Accounts>(
      builder: (context, value, child) => Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: gradientBackGround,
                begin: Alignment.topLeft,
                end: Alignment.bottomRight),
          ),
          child: Center(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.90,
              width: MediaQuery.of(context).size.width * 0.85,
              decoration: BoxDecoration(
                backgroundBlendMode: BlendMode.overlay,
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: Icon(
                        Icons.arrow_back,
                        color: Colors.black,
                        size: MediaQuery.of(context).size.width * 0.08,
                      ),
                    ),
                  ),
                  Text(
                    "Settings",
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.06,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  SettingsFeature(
                    icon: Icons.style,
                    featureName: "Theme",
                    child: ToggleSwitch(
                      minWidth: MediaQuery.of(context).size.width * 0.18,
                      minHeight: MediaQuery.of(context).size.height * 0.15,
                      initialLabelIndex: 1,
                      cornerRadius: 20.0,
                      activeFgColor: Colors.white,
                      inactiveBgColor: Colors.grey,
                      inactiveFgColor: Colors.white,
                      totalSwitches: 2,
                      icons: const [
                        FontAwesomeIcons.lightbulb,
                        FontAwesomeIcons.solidLightbulb,
                      ],
                      iconSize: MediaQuery.of(context).size.height * 0.15,
                      activeBgColors: const [
                        [Colors.black45, Colors.black26],
                        [Colors.deepPurpleAccent, Colors.purple]
                      ],
                      animate: true,
                      curve: Curves.bounceInOut,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  const Divider(
                    indent: 20,
                    endIndent: 20,
                    thickness: 1,
                  ),
                  SettingsFeature(
                    icon: Icons.lens_blur,
                    featureName: "Font size",
                    child: SliderTheme(
                      data: SliderThemeData(
                        trackHeight: MediaQuery.of(context).size.height * 0.008,
                      ),
                      child: Slider(
                        value: _currentSliderValue,
                        min: 0.25,
                        max: 2,
                        divisions: 7,
                        onChanged: (double value) {
                          setState(
                            () {
                              _currentSliderValue = value;
                            },
                          );
                        },
                        label: 'x$_currentSliderValue',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  const Divider(
                    indent: 25,
                    endIndent: 25,
                    thickness: 1,
                  ),
                  SettingsFeature(
                      icon: Icons.flag,
                      featureName: "Text Language",
                      child: DropdownButton(
                        value: dropdownValue,
                        icon: const Icon(Icons.arrow_drop_down),
                        elevation: 50,
                        style: const TextStyle(color: foregroundColorText),
                        underline: Container(
                          height: 1.5,
                          color: Colors.deepPurpleAccent,
                        ),
                        onChanged: (value) {
                          setState(
                            () {
                              dropdownValue = value!;
                            },
                          );
                        },
                        items: languageList
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.02,
                              ),
                            ),
                          );
                        }).toList(),
                      )),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  const Divider(
                    indent: 25,
                    endIndent: 25,
                    thickness: 1,
                  ),
                  SettingsFeature(
                    icon: Icons.save,
                    featureName: "Saved Items",
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                      width: MediaQuery.of(context).size.width * 0.28,
                      child: OutlinedButton(
                        onPressed: () => _dialogBuilder(context),
                        child: Text(
                          'Open List',
                          style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.035,
                              fontWeight: FontWeight.w900),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  const Divider(
                    indent: 25,
                    endIndent: 25,
                    thickness: 1,
                  ),

                  AnimatedContainer(
                    duration: const Duration(milliseconds: 30),
                    color: transparent,
                    child: Material(
                      color:
                          transparent, // Set the Material color to transparent
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (ctx) => const ProfileScreen(),
                            ),
                          );
                        },
                        child: SettingsFeature(
                          icon: Icons.person_pin_circle_outlined,
                          featureName: "Profile",
                          child: Icon(
                            Icons.arrow_right,
                            size: MediaQuery.of(context).size.width * 0.1,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  const Divider(
                    indent: 25,
                    endIndent: 25,
                    thickness: 1,
                  ),

                  //TODO: Logout Row Widget
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 30),
                    color: transparent,
                    child: Material(
                      color:
                          transparent, // Set the Material color to transparent
                      child: InkWell(
                        onTap: () {
                          value.logout();
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (ctx) => const AuthScreen(
                                isLogin: true,
                              ),
                            ),
                            (Route<dynamic> route) => false,
                          );
                        },
                        child: SettingsFeature(
                          icon: FontAwesomeIcons.doorOpen,
                          featureName: "Logout",
                          child: Icon(
                            Icons.arrow_right,
                            size: MediaQuery.of(context).size.width * 0.1,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  const Divider(
                    indent: 25,
                    endIndent: 25,
                    thickness: 1,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CustomButton(
                          text: ' Delete Account ',
                          backGroundColor: Colors.red,
                          foreGroundColor: Colors.white,
                          borderSideColor: Colors.black,
                          borderWidth: 0.5,
                          onPressed: () {
                            value.deleteAccount();
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (ctx) => const HomeScreen(),
                              ),
                              (Route<dynamic> route) => false,
                            );
                          },
                          icon: FontAwesomeIcons.trashCan)
                    ],
                  ),

                  //TODO: About and Help & Support
                  Center(
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.13,
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: "About",
                                    style: const TextStyle(
                                        color: foregroundColorForLowerText),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        _launchURL(
                                            Uri.parse('https://flutter.dev/'));
                                      },
                                  ),
                                  const TextSpan(
                                      text: ' . ',
                                      style: TextStyle(
                                          color: foregroundColorForLowerText)),
                                  TextSpan(
                                    text: "Help & Support",
                                    style: const TextStyle(
                                        color: foregroundColorForLowerText),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        _launchURL(
                                          Uri.parse('https://flutter.dev/'),
                                        );
                                      },
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Future<void> _dialogBuilder(BuildContext context) {
  return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Saved Items'),
          content: const ExpanssionPanelListFeature(
            numberOfItems: numberOfItemsintheExpansionPanel,
          ),
          actions: <Widget>[
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Close'))
          ],
        );
      });
}

Future<void> _launchURL(Uri url) async {
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    throw 'Could not launch $url';
  }
}
