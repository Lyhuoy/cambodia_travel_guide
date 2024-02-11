import 'package:flutter/material.dart';

class ChangeNewPasswordPage extends StatefulWidget {
  const ChangeNewPasswordPage({super.key});

  @override
  State<ChangeNewPasswordPage> createState() => _ChangeNewPasswordPageState();
}

class _ChangeNewPasswordPageState extends State<ChangeNewPasswordPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Change New Password Page'),
      ),
    );
  }
}
