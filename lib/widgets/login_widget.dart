import 'package:shop/models/accounts.dart';
import 'package:shop/screens/types_screen.dart';
import 'package:shop/widgets/text_form_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key});

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool visText = true;
  String warningText = '';
  @override
  Widget build(BuildContext context) {
    return Consumer<Accounts>(
      builder: (context, value, child) => Column(
        children: [
          const Text(
            "Login",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
          TextFormFieldWidget(
            controller: emailController,
            prefixIcon: const Icon(Icons.email),
            labelText: "Email",
          ),
          TextFormFieldWidget(
            controller: passwordController,
            prefixIcon: const Icon(Icons.lock),
            vistext: visText,
            labelText: "Password",
            suffixIcon: IconButton(
              onPressed: () {
                setState(
                  () {
                    visText = !visText;
                  },
                );
              },
              icon: Icon(visText ? Icons.visibility : Icons.visibility_off),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
            ),
            onPressed: () {
              if (emailController.text.isEmpty ||
                  passwordController.text.isEmpty) {
                setState(() {
                  warningText = 'Please fill in all fields';
                });
              }
              if (value.login(emailController.text, passwordController.text)) {
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                    builder: (context) => const TypesScreen(),
                  ),
                  (Route<dynamic> route) => false,
                );
              } else {
                setState(
                  () {
                    warningText = 'Invalid email or password';
                  },
                );
              }
            },
            child: const Text(
              "Login",
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ),
          Text(
            warningText,
            style: const TextStyle(
              color: Colors.red,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
