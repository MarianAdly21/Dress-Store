import 'package:dress_store/models/item_model.dart';
import 'package:flutter/material.dart';

class IconFavoriteButtonCustom extends StatelessWidget {
  const IconFavoriteButtonCustom({
    super.key,
    required this.itemModel,
    required this.onFavPressed,
  });

  final ItemModel itemModel;
  final void Function() onFavPressed;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 16,
      backgroundColor: Colors.white,
      child: itemModel.isFavorite
          ? IconButton(
              onPressed: onFavPressed,
              icon: const Icon(
                Icons.favorite_sharp,
                size: 19,
                color: Color(0xffFF9A9F),
              ),
            )
          : IconButton(
              onPressed: onFavPressed,
              icon: const Icon(
                Icons.favorite_border_outlined,
                size: 19,
                color: Color(0xffFF9A9F),
              ),
            ),
    );
  }
}
