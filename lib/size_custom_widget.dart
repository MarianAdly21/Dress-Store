import 'package:dress_store/features/Home/models/item_model.dart';
import 'package:flutter/material.dart';

class SizeCustomWidget extends StatelessWidget {
  const SizeCustomWidget({
    super.key,
    required this.onSizeTap,
    required this.item,
    required this.indexOfitem,
    required this.sizeChoiced,
  });
  
  final ItemModel item;
  final int indexOfitem;
  final Function() onSizeTap;
  final int? sizeChoiced;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onSizeTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        height: 55,
        width: 55,
        decoration: BoxDecoration(
          color: item.sizes[indexOfitem].id == sizeChoiced
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
            item.sizes[indexOfitem].size.toString(),
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
