import 'package:flutter/material.dart';

class SizeCustomWidget extends StatelessWidget {
  const SizeCustomWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        
      },
      child: Container(
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
            "XL",
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
