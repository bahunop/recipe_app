import 'package:flutter/material.dart';
import 'package:recipe_app/login_screen/screen/login_screen.dart';
import 'package:recipe_app/login_screen/screen/register_screen.dart';

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {
  bool showLoginPage = true;
  void toggleScreens() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginScreen(ontapped: toggleScreens);
    } else {
      return RegisterScreen(
        ontapped: toggleScreens,
      );
    }
  }
}
