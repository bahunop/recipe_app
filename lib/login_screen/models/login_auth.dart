import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:recipe_app/login_screen/widgets/login_or_register.dart';
import 'package:recipe_app/main_screens/widgets/bottomnavigator.dart';

class LoginAuth extends StatelessWidget {
  const LoginAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return const BottomNavigation();
            } else {
              return const LoginOrRegister();
            }
          }),
    );
  }
}
