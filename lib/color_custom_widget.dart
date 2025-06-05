import 'package:flutter/material.dart';

class ColorCustomWidget extends StatelessWidget {
  const ColorCustomWidget({
    super.key, required this.color,
  });
  final Color color;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
          height: 30,
          width: 30,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: color,
          ),
        ),
      ),
    );
  }
}
