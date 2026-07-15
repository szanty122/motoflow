import 'package:flutter/material.dart';
import 'features/auth/login_screen.dart';

class MotoFlowApp extends StatelessWidget {
  const MotoFlowApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}