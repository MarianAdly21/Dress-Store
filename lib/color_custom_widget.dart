import 'package:dress_store/features/Home/models/item_model.dart';
import 'package:flutter/material.dart';

class ColorCustomWidget extends StatelessWidget {
  const ColorCustomWidget({
    super.key,
    required this.colorModel,
    this.onColorTap,
    required this.choicedColorId,
  });
  final ColorModel colorModel;

  final void Function()? onColorTap;
  final int? choicedColorId;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onColorTap,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
          height: 30,
          width: 30,
          decoration: BoxDecoration(
            border: colorModel.id == choicedColorId
                ? colorModel.color == Colors.black
                    ? Border.all(
                        color: Colors.white,
                        width: 2,
                      )
                    : Border.all(
                        color: Colors.black,
                        width: 2,
                      )
                : null,
            borderRadius: BorderRadius.circular(30),
            color: colorModel.color,
          ),
        ),
      ),
    );
  }
}
