import 'package:flutter/material.dart';

class ProfileCustomWidget extends StatelessWidget {
  const ProfileCustomWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
      backgroundImage: AssetImage('assets/images/profile .jpg'),
      radius: 25,
    );
  }
}
