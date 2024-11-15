import 'package:flutter/material.dart';

class LoginOption extends StatefulWidget {
  final String imagePath;
  final Function()? ontap;
  const LoginOption({
    super.key,
    required this.imagePath,
    required this.ontap,
  });

  @override
  State<LoginOption> createState() => _LoginOptionState();
}

class _LoginOptionState extends State<LoginOption> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.ontap,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(16),
          color: Colors.grey[200],
        ),
        child: Image.asset(
          widget.imagePath,
          height: 40,
        ),
      ),
    );
  }
}
