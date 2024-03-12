import 'package:shop/models/accounts.dart';
import 'package:shop/screens/types_screen.dart';
import 'package:shop/widgets/text_form_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
RegExp emailPattern =
    RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$");
RegExp passwordPattern =
    RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');

class RegisterWidget extends StatefulWidget {
  const RegisterWidget({super.key});

  @override
  State<RegisterWidget> createState() => _RegisterWidgetState();
}

class _RegisterWidgetState extends State<RegisterWidget> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  bool visText = true;
  bool visText2 = true;
  String warningText = '';
  @override
  Widget build(BuildContext context) {
    return Consumer<Accounts>(
      builder: (context, value, child) => Column(
        children: [
          const Text(
            "Create a new account",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(246, 77, 68, 68),
            ),
          ),
          TextFormFieldWidget(
            controller: nameController,
            prefixIcon: const Icon(Icons.person),
            labelText: "Name",
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
          TextFormFieldWidget(
            controller: confirmPasswordController,
            prefixIcon: const Icon(Icons.lock),
            vistext: visText2,
            labelText: "Confirm Password",
            suffixIcon: IconButton(
              onPressed: () {
                setState(
                  () {
                    visText2 = !visText2;
                  },
                );
              },
              icon: Icon(visText2 ? Icons.visibility : Icons.visibility_off),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
            ),
            onPressed: () {
              if (nameController.text.trim().isEmpty ||
                  emailController.text.trim().isEmpty ||
                  passwordController.text.trim().isEmpty ||
                  confirmPasswordController.text.trim().isEmpty) {
                setState(
                  () {
                    warningText = "Please fill in all fields";
                  },
                );
                return;
              }
              if (!emailPattern.hasMatch(emailController.text)) {
                setState(() {
                  warningText = "Invalid Email";
                });

                return;
              }
              if (!passwordPattern.hasMatch(passwordController.text)) {
                setState(
                  () {
                    warningText = "Password not accepted";
                  },
                );

                return;
              }
              if (passwordController.text != confirmPasswordController.text) {
                warningText = "Passwords do not match";
                setState(() {});
                return;
              }
              value.addAccount(
                nameController.text,
                emailController.text,
                passwordController.text,
              );
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                  builder: (context) => const TypesScreen(),
                ),
                (Route<dynamic> route) => false,
              );
            },
            child: const Text(
              "Register",
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
