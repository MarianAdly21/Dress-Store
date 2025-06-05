import 'package:dress_store/button_custom_widget.dart';
import 'package:dress_store/color_custom_widget.dart';
import 'package:dress_store/features/Home/models/item_model.dart';
import 'package:dress_store/icon_favorite_button_custom.dart';
import 'package:dress_store/size_custom_widget.dart';
import 'package:flutter/material.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key, required this.itemId});
  final int itemId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Color(0xffFD8186),
          ),
        ),
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/item3.webp"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              margin: const EdgeInsets.only(
                bottom: 30,
                left: 20,
                right: 20,
              ),
              width: 330,
              height: 400,
              decoration: BoxDecoration(
                color: const Color(0xffF8A3A7).withOpacity(0.9),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Strapless dress",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 3),
                            Text(
                              "4,975 EGP",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        IconFavoriteButtonCustom(
                            itemModel: ItemModel(
                                id: 9,
                                image: "",
                                colors: [],
                                description: "",
                                sizes: [],
                                name: '',
                                price: 44),
                            onFavPressed: () {})
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20, bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizeCustomWidget(),
                          SizeCustomWidget(),
                          SizeCustomWidget(),
                          SizeCustomWidget(),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ColorCustomWidget(),
                        ColorCustomWidget(),
                        ColorCustomWidget(),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 6),
                      child: Text(
                        "The dress strapless Its elegant silhouette is enhanced by a large bow detail, adding a touch of.",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    // ElevatedButton(
                    //     style: ElevatedButton.styleFrom(
                    //       padding: const EdgeInsets.symmetric(
                    //           vertical: 12, horizontal: 40),
                    //       backgroundColor: Colors.white,
                    //       foregroundColor: Color(0xffFF9A9F),
                    //       shape: RoundedRectangleBorder(
                    //         borderRadius: BorderRadius.circular(16),
                    //       ),
                    //     ),
                    //     onPressed: () {},
                    //     child: Text(
                    //       "Add to your cart  ",
                    //       style: TextStyle(
                    //         fontSize: 20,
                    //       ),
                    //     ))

                    ButtonCustomWidget(),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

