import 'package:dress_store/models/size_model.dart';
import 'package:flutter/material.dart';

class SizeCustomWidget extends StatelessWidget {
  const SizeCustomWidget({
    super.key,
    required this.onSizeTap,
    required this.sizeModel,
    
    required this.sizeChoiced,
  });

  final SizeModel sizeModel;
 
  final Function() onSizeTap;
  final int? sizeChoiced;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onSizeTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        height: 55,
        width: 55,
        decoration: BoxDecoration(
          color: sizeModel.id == sizeChoiced
              ? const Color(
                  0xffFF737A,
                )
              : const Color(
                  0xffFF9A9F,
                ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            sizeModel.size,
            style: const TextStyle(
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
