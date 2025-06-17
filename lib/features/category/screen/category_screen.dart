import 'package:dress_store/features/Home/widgets/products_sliver_grid_list_widget.dart';
import 'package:dress_store/models/item_model.dart';
import 'package:dress_store/widgets/back_button_custom_widget.dart';
import 'package:dress_store/widgets/background_custom_widget.dart';
import 'package:dress_store/widgets/icon_favorite_button_custom.dart';
import 'package:dress_store/widgets/profile_custom_widget.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key, required this.categoryId});
  final int categoryId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffF8A3A7),
        leadingWidth: 100,
        leading: const BackButtonCustomWidget(),
        centerTitle: true,
        title: const Text(
          "Maxi Dress",
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: const [
          ProfileCustomWidget(),
          SizedBox(width: 25),
        ],
      ),
      body: Stack(
        children: [
          const BackgroundCustomWidget(),
          Padding(
            padding: const EdgeInsets.all(18),
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      const Text(
                        "Best Selling Dress",
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      AspectRatio(
                        aspectRatio: 340 / 480,
                        child: Container(
                          // height: 480,
                          // width: 340,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: const DecorationImage(
                              image: AssetImage("assets/images/itme8.webp"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Expanded(
                                  child: Text(
                                    "marianaAdly",
                                    style: TextStyle(
                                        fontSize: 26,
                                        overflow: TextOverflow.ellipsis),
                                  ),
                                ),
                                IconFavoriteButtonCustom(
                                    itemModel: ItemModel(
                                        id: 1,
                                        image: "",
                                        colors: [],
                                        description: "",
                                        sizes: [],
                                        name: "",
                                        price: 99),
                                    onFavPressed: () {})
                              ],
                            ),
                            const Text(
                              "888 EGP",
                              style: TextStyle(fontSize: 16),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                ProductsSliverGridListWidget(
                  items: [],
                  isFavorite: false,
                  onFavPressed: (int indexOfItem, ItemModel itemModel) {},
                  onTap: (int itemId) {},
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
