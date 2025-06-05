import 'package:flutter/material.dart';

class SizeCustomWidget extends StatelessWidget {
  const SizeCustomWidget({
    super.key,
    required this.size,
  });
  final String size;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        height: 55,
        width: 55,
        decoration: BoxDecoration(
          color: Color(
            0xffFF9A9F,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            size,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
