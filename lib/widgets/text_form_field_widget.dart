import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatelessWidget {
  const TextFormFieldWidget(
      {super.key,
      required this.controller,
      required this.prefixIcon,
      this.suffixIcon,
      this.vistext,
      this.labelText});
  final TextEditingController controller;
  final Icon prefixIcon;
  final IconButton? suffixIcon;
  final bool? vistext;
  final String? labelText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: vistext ?? false,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        labelText: labelText,
      ),
    );
  }
}
