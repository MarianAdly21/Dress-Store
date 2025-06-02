import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.topCenter,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/splash.jpg'), fit: BoxFit.cover),
        ),
        child: const Padding(
          padding: EdgeInsets.only(top: 12),
          child: Text(
            "Dress Dreams",
            style: TextStyle(
              fontFamily: 'Alata',
              fontSize: 50,
              color: Color(0xffF8A3A7),
            ),
          ),
        ),
      ),
    );
  }
}
