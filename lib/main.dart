import 'package:dress_store/features/sign_up/screen/sign_up_screen.dart';
import 'package:dress_store/features/welcome/screen/welcome_screen.dart';
import 'package:dress_store/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const DressStore());
}

class DressStore extends StatelessWidget {
  const DressStore({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignUpScreen(),
    );
  }
}
