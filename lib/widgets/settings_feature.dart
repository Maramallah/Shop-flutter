import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SettingsFeature extends StatelessWidget {
  const SettingsFeature(
      {super.key,
      required this.icon,
      required this.featureName,
      required this.child});
  final IconData icon;
  final String featureName;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.06,
      width: MediaQuery.of(context).size.width * 0.75,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Icon(
              icon,
              size: MediaQuery.of(context).size.width * 0.09,
            ),
          ),
          Text(
            featureName,
            style: TextStyle(
                fontSize: MediaQuery.of(context).size.width * 0.05,
                fontWeight: FontWeight.bold),
          ),
          Expanded(
              child: Align(
            alignment: Alignment.centerRight,
            child: child,
          ))
        ],
      ),
    );
  }
}
