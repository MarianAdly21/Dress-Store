import 'package:flutter/material.dart';

class ButtonCustomWidget extends StatelessWidget {
  const ButtonCustomWidget({
    super.key,
    this.backgroundColor,
    this.isloading = false,
    required this.onTap,
    required this.text,
  });
  final void Function() onTap;
  final String text;
  final Color? backgroundColor;
  final bool isloading;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(top: 16),
        child: Container(
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: backgroundColor ?? Colors.white,
          ),
          child: Center(
            child: isloading
                ? const CircularProgressIndicator(
                    strokeWidth: 3,
                    color: Color(0xffFF9A9F),
                  )
                : Text(
                    text,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xffFF9A9F),
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
