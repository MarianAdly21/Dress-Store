import 'package:flutter/material.dart';

class BackButtonCustomWidget extends StatelessWidget {
  const BackButtonCustomWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: const Icon(
        Icons.arrow_back_ios_new,
        color: Color(0xffFD8186),
      ),
    );
  }
}
