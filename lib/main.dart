import 'package:dress_store/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const DressStore());
}

class DressStore extends StatelessWidget {
  const DressStore({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
