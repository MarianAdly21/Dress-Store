import 'package:dress_store/res/app_asset_paths.dart';
import 'package:flutter/material.dart';

class BaseAuthScreen extends StatelessWidget {
  const BaseAuthScreen({super.key, required this.child});
final Widget child;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AppAssetPaths.splashImage),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width - 50,
          // margin: const EdgeInsets.only(right: 50),
          decoration: BoxDecoration(
            color: const Color(0xffF8A3A7).withValues(alpha: 0.8),
          ),
          child:child 
        ),
      ],
    );
  }
}
