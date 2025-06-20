import 'package:dress_store/widgets/button_custom_widget.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              "assets/images/splash.jpg",
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: ButtonCustomWidget(
                      backgroundColor: Colors.black,
                      onTap: () {},
                      text: "Sign Up"),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: ButtonCustomWidget(onTap: () {}, text: "Login"),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
