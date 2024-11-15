import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  final user = FirebaseAuth.instance.currentUser!;
  void letUserOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(onPressed: letUserOut, icon: const Icon(Icons.logout))
          ],
        ),
        body: Center(
          child: Column(
            children: [
              Container(
                  height: 90,
                  width: 80,
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(20)),
                  child: const Icon(Icons.people)),
              const SizedBox(
                height: 30,
              ),
              Text(
                "Logged in as :${user.email!}",
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ],
          ),
        ));
  }
}
