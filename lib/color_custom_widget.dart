import 'package:dress_store/features/Home/models/item_model.dart';
import 'package:flutter/material.dart';

class ColorCustomWidget extends StatelessWidget {
  const ColorCustomWidget({
    super.key,
    required this.itemModel,
    required this.indexOfItem,
     this.onColorTap,
    required this.colorChoicedId,
  });
  final ItemModel itemModel;
  final int indexOfItem;
  final void Function()? onColorTap;
  final int? colorChoicedId;

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
            border: colorChoicedId == itemModel.colors[indexOfItem].id
                ? itemModel.colors[indexOfItem].color == Colors.black
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
            color: itemModel.colors[indexOfItem].color,
          ),
        ),
      ),
    );
  }
}
