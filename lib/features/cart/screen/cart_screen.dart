import 'package:dress_store/models/color_model.dart';
import 'package:dress_store/models/size_model.dart';
import 'package:dress_store/widgets/back_button_custom_widget.dart';
import 'package:dress_store/widgets/background_custom_widget.dart';
import 'package:dress_store/widgets/button_custom_widget.dart';
import 'package:dress_store/widgets/color_custom_widget.dart';
import 'package:dress_store/widgets/profile_custom_widget.dart';
import 'package:dress_store/widgets/size_custom_widget.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leadingWidth: 100,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const BackButtonCustomWidget(),
        title: const Text(
          "My Cart",
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
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return _cartItem();
                  }),
            ),
          ),
          _partOfTotalPriceAndPay()
        ],
      ),
    );
  }
///////////////////////////////////////////////////////////
//////////////////// Widget methods ///////////////////////
///////////////////////////////////////////////////////////
  Widget _partOfTotalPriceAndPay() {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        height: 330,
        decoration: BoxDecoration(
            color: const Color(0xffF8A3A7).withOpacity(0.9),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            )),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 45, vertical: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total (3 Item)",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Text(
                    "10,000 EGP",
                    style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20),
                  )
                ],
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Discount",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Text(
                    "10,000 EGP",
                    style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20),
                  )
                ],
              ),
              const Divider(
                color: Color(0xff6C8090),
                indent: 30,
                endIndent: 30,
                thickness: 1,
                height: 10,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Sub Total",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Text(
                    "10,000 EGP",
                    style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20),
                  )
                ],
              ),
              ButtonCustomWidget(
                onTap: () {},
                text: "Pay",
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _cartItem() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 32),
      child: Row(
        children: [
          Container(
            height: 230,
            width: 160,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                image: const DecorationImage(
                    image: AssetImage(
                      "assets/images/item7.jpeg",
                    ),
                    fit: BoxFit.fill)),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    const Text(
                      "marianaAdly",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.delete_outline,
                          color: Color(0xffFD8186),
                          size: 35,
                        ))
                  ],
                ),
                const Text(
                  "155 EGP",
                  style: TextStyle(
                    color: Color(0xff828282),
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Row(
                  children: [
                    ColorCustomWidget(
                      colorModel: ColorModel(color: Colors.black, id: 4),
                      choicedColorId: 2,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    SizeCustomWidget(
                      onSizeTap: () {},
                      sizeModel: SizeModel(size: "XL", id: 1),
                      sizeChoiced: 1,
                    )
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                Container(
                  height: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Color(0xffFF737A)),
                  child: Row(
                    children: [
                      IconButton(onPressed: () {}, icon: Icon(Icons.add)),
                      Text("1"),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.remove,
                          ))
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
