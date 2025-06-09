import 'package:dress_store/features/Home/screens/home_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    _navigatToHome();

    super.initState();
  }

  Future<void> _navigatToHome() async {
    await Future.delayed(const Duration(seconds: 2));
    if (!mounted) return;
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const HomeScreen()));
  }

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
