import 'package:dress_store/demo_data.dart';
import 'package:dress_store/features/cart/bloc/cart_screen_bloc.dart';
import 'package:dress_store/models/add_to_cart_send_model.dart';
import 'package:dress_store/widgets/back_button_custom_widget.dart';
import 'package:dress_store/widgets/background_custom_widget.dart';
import 'package:dress_store/widgets/button_custom_widget.dart';
import 'package:dress_store/widgets/color_custom_widget.dart';
import 'package:dress_store/widgets/profile_custom_widget.dart';
import 'package:dress_store/widgets/size_custom_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartScreenBloc(),
      child: const CartScreenWithBloc(),
    );
  }
}

class CartScreenWithBloc extends StatefulWidget {
  const CartScreenWithBloc({super.key});

  @override
  State<CartScreenWithBloc> createState() => _CartScreenState();
}

late List<AddToCartSendModel> items;

class _CartScreenState extends State<CartScreenWithBloc> {
  @override
  void initState() {
    _loadedItemsToCartEvent();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 100,
        centerTitle: true,
        backgroundColor: const Color(0xffF8A3A7),
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
      body: BlocListener<CartScreenBloc, CartScreenState>(
          listener: (context, state) {
            if (state is LoadedItemsToCartState) {
              items = state.cartItems;
            }
          },
          child: Stack(
            children: [
              const BackgroundCustomWidget(),
              BlocBuilder<CartScreenBloc, CartScreenState>(
                builder: (context, state) {
                  if (state is LoadedItemsToCartState ||
                      state is DeleteItemState ||
                      state is IncreaseItemState ||
                      state is DecreaseItemState) {
                    return Column(
                      children: [
                        Expanded(
                          child: ListView.builder(
                              padding: const EdgeInsets.only(
                                top: 16,
                                left: 16,
                                right: 16,
                                bottom: 16,
                              ),
                              itemCount: items.length,
                              itemBuilder: (context, index) {
                                return _cartItem(index);
                              }),
                        ),
                        _partOfTotalPriceAndPay(),
                      ],
                    );
                  } else if (state is LoadingState) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is ErrorState) {
                    return Center(child: Text(state.errorMessage));
                  } else {
                    return const SizedBox();
                  }
                },
              )
            ],
          )),
    );
  }

///////////////////////////////////////////////////////////
//////////////////// Widget methods ///////////////////////
///////////////////////////////////////////////////////////
  Widget _partOfTotalPriceAndPay() {
    return Container(
      height: 280,
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total (${DemoData.cartItems.length} Item)",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Text(
                  " ${DemoData.cartItems.fold(0.0, (sum, element) => sum + (element.item.price * element.quantity)).round()} EGP",
                  style: const TextStyle(
                      fontWeight: FontWeight.w800, fontSize: 20),
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
                  "10%",
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Sub Total",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Text(
                  " ${DemoData.cartItems.fold(0.0, (sum, element) => sum + (element.getDiscountedPrice(10 / 100))).round()} EGP",
                  style: const TextStyle(
                      fontWeight: FontWeight.w800, fontSize: 20),
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
    );
  }

  Widget _cartItem(int index) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 32),
      child: Row(
        children: [
          Container(
            height: 230,
            width: 160,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                image: DecorationImage(
                    image: AssetImage(
                      items[index].item.image,
                    ),
                    fit: BoxFit.fill)),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          items[index].item.name,
                          style: const TextStyle(
                            overflow: TextOverflow.ellipsis,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      IconButton(
                          onPressed: () {
                            _deleteItemEvent(index);
                          },
                          icon: const Icon(
                            Icons.delete_outline,
                            color: Color(0xffFD8186),
                            size: 35,
                          ))
                    ],
                  ),
                  Text(
                    "${items[index].item.price} EGP",
                    style: const TextStyle(
                      color: Color(0xff828282),
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Row(
                    children: [
                      ColorCustomWidget(
                        colorModel: items[index].item.colors.firstWhere(
                            (element) => element.id == items[index].colorId),
                        choicedColorId: items[index].colorId,
                      ),
                      const SizedBox(width: 10),
                      SizeCustomWidget(
                        onSizeTap: () {},
                        sizeModel: items[index].item.sizes.firstWhere(
                              (element) => element.id == items[index].sizeId,
                            ),
                        sizeChoiced: items[index].sizeId,
                      )
                    ],
                  ),
                  const SizedBox(height: 16),
                  Container(
                    width: 110,
                    height: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: const Color(0xffFF737A)),
                    child: Row(
                      children: [
                        Expanded(
                          child: IconButton(
                            onPressed: () {
                              _increaseItemEvent(index);
                            },
                            icon: const Icon(Icons.add),
                          ),
                        ),
                        Text(items[index].quantity.toString()),
                        Expanded(
                          child: IconButton(
                              onPressed: () {
                                _decreaseItemEvent(index);
                              },
                              icon: const Icon(
                                Icons.remove,
                              )),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

///////////////////////////////////////////////////////////
//////////////////// Helper methods ///////////////////////
///////////////////////////////////////////////////////////
  void _decreaseItemEvent(int index) {
    currenBloc.add(DecreaseItemEvent(item: items[index].item));
  }

  void _increaseItemEvent(int index) {
    currenBloc.add(IncreaseItemEvent(item: items[index].item));
  }

  void _deleteItemEvent(int index) {
    currenBloc
        .add(DeleteItemEvent(itemId: items[index].item.id, itemIndex: index));
  }

  void _loadedItemsToCartEvent() {
    currenBloc.add(LoadedItemsToCartEvent());
  }

  CartScreenBloc get currenBloc => BlocProvider.of<CartScreenBloc>(context);
}
