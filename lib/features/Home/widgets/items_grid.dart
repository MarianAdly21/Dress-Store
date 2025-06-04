import 'package:dress_store/features/Home/models/item_model.dart';
import 'package:flutter/material.dart';

class ItemsGrid extends StatelessWidget {
  const ItemsGrid({super.key});
  final List<ItemModel> items = const [
    // ItemModel(
    //     image: "assets/images/item1.webp",
    //     name: "Kendry Gdsxvx",
    //     price: 2.1333,
    //     ),
    // ItemModel(
    //     image: "assets/images/item2.webp",
    //     name: "Kendry Gdsxvx",
    //     price: 2.1333),
    // ItemModel(
    //     image: "assets/images/item3.webp",
    //     name: "Kendry Gdsxvx",
    //     price: 2.1333),
    // ItemModel(
    //     image: "assets/images/item4.webp",
    //     name: "Kendry Gdsxvx",
    //     price: 2.1333),
    // ItemModel(
    //     image: "assets/images/item5.webp",
    //     name: "Kendry Gdsxvx",
    //     price: 2.1333),
    // ItemModel(
    //     image: "assets/images/item1.webp",
    //     name: "Kendry Gdsxvx",
    //     price: 2.1333),
  ];

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
          );
        });
  }
}

class _ItemCutomWidget extends StatelessWidget {
  const _ItemCutomWidget({
    super.key,
    required this.itemModel,
  });
  final ItemModel itemModel;

  @override
  Widget build(BuildContext context) {
    return Column(
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
            child: CircleAvatar(
              radius: 16,
              backgroundColor: Colors.white,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.favorite_border_outlined,
                  size: 19,
                  color: Color(0xffFF9A9F),
                ),
              ),
            ),
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
              itemModel.price.toString(),
              style: const TextStyle(
                color: Color(0xff828282),
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        )
      ],
    );
  }
}
