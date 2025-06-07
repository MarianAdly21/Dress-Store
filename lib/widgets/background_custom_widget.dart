import 'package:flutter/material.dart';

class BackgroundCustomWidget extends StatelessWidget {
  const BackgroundCustomWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Positioned.fill(
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xffF8A3A7), Color(0xffFCFCFC)],
          ),
        ),
      ),
    );
  }
}
