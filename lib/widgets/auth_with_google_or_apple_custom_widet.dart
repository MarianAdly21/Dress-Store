import 'package:dress_store/res/app_color.dart';
import 'package:flutter/material.dart';

class AuthWithGoogleOrAppleCustomWidet extends StatelessWidget {
  const AuthWithGoogleOrAppleCustomWidet({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            text,
            style: const TextStyle(
              fontSize: 20,
              color: AppColor.whiteColor,
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              _customIconButton(onTap: () {}, icon: Icons.g_mobiledata_sharp),
              _customIconButton(onTap: () {}, icon: Icons.apple),
            ],
          )
        ],
      ),
    );
  }

  Widget _customIconButton({required IconData icon, Function()? onTap}) {
    return IconButton(
      onPressed: onTap,
      icon: Icon(icon),
      iconSize: 32,
    );
  }
}
