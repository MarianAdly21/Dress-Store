import 'package:dress_store/models/item_model.dart';
import 'package:dress_store/widgets/icon_favorite_button_custom.dart';
import 'package:flutter/material.dart';

class ProductsSliverGridListWidget extends StatelessWidget {
  const ProductsSliverGridListWidget({
    super.key,
    required this.items,
   // required this.isFavorite,
    required this.onFavPressed,
    required this.onTap,
  });
  final List<ItemModel> items;
 // final bool isFavorite;
  final void Function(int itemId) onTap;
  final void Function(int indexOfItem, ItemModel itemModel) onFavPressed;
  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 20,
          childAspectRatio: 0.6,
        ),
        itemCount: items.length,
        itemBuilder: (context, index) {
          return _ItemCutomWidget(
            itemModel: items[index],
          //  isFavorite: isFavorite,
            onTap: () => onTap(items[index].id),
            onFavPressed: () => onFavPressed(index, items[index]),
          );
        });
  }
}

class _ItemCutomWidget extends StatelessWidget {
  const _ItemCutomWidget({
    super.key,
    required this.itemModel,
   // required this.isFavorite,
    required this.onFavPressed,
    required this.onTap,
  });
  final ItemModel itemModel;
 // final bool isFavorite;
  final void Function() onFavPressed;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Stack(alignment: Alignment.topRight, children: [
            Container(
              height: 220,
              width: 190,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: AssetImage(itemModel.image),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: IconFavoriteButtonCustom(
                  itemModel: itemModel, onFavPressed: onFavPressed),
            )
          ]),
          const SizedBox(
            height: 6,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                itemModel.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "${itemModel.price} EGP",
                style: const TextStyle(
                  color: Color(0xff828282),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
