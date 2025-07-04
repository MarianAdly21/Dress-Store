
import 'package:dress_store/models/add_to_cart_send_model.dart';
import 'package:dress_store/widgets/back_button_custom_widget.dart';
import 'package:dress_store/widgets/button_custom_widget.dart';
import 'package:dress_store/widgets/color_custom_widget.dart';
import 'package:dress_store/models/item_model.dart';
import 'package:dress_store/features/product/bloc/product_screen_bloc.dart';
import 'package:dress_store/widgets/icon_favorite_button_custom.dart';
import 'package:dress_store/widgets/size_custom_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key, required this.itemId});
  final int itemId;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductScreenBloc(),
      child: ProductScreenWithBloc(id: itemId),
    );
  }
}

class ProductScreenWithBloc extends StatefulWidget {
  const ProductScreenWithBloc({super.key, required this.id});
  final int id;

  @override
  State<ProductScreenWithBloc> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreenWithBloc> {
  @override
  void initState() {
    _getProductEvent();
    super.initState();
  }

  late ItemModel item;
  int? choicedSizeId;
  int? choicedColorId;
  bool isAdded = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const BackButtonCustomWidget(),
      ),
      body: BlocListener<ProductScreenBloc, ProductScreenState>(
        listener: (context, state) {
          if (state is LoadedProductSuccessfullyState) {
            item = state.itemModel;
          }
          if (state is ChoiceSizeState) {
            choicedSizeId = state.sizeId;
          }
          if (state is ChoiceColorState) {
            choicedColorId = state.colorId;
          }
          if (state is AddToCartState) {
            isAdded = state.isAddedItem;
          }
        },
        child: BlocBuilder<ProductScreenBloc, ProductScreenState>(
          builder: (context, state) {
            if (state is LoadedProductSuccessfullyState ||
                state is ChoiceSizeState ||
                state is ChoiceColorState ||
                state is ConvetToFavoritetState ||
                state is AddToCartState) {
              return _contentOfBody();
            } else if (state is LoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is ErrorState) {
              return Center(
                child: Text(state.errorMessage),
              );
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }

///////////////////////////////////////////////////////////
//////////////////// Widget methods ///////////////////////
///////////////////////////////////////////////////////////
  Widget _contentOfBody() {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(item.image),
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
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.name,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 3),
                          Text(
                            item.price.toString(),
                            style: const TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      IconFavoriteButtonCustom(
                        itemModel: item,
                        onFavPressed: () {
                          currenBolc.add(ConvertToFavoriteEvent(itme: item));
                        },
                      ),
                    ],
                  ),
                  _rowOfSizes(),
                  _rowOfColors(),
                  Padding(
                    padding: const EdgeInsets.only(top: 6),
                    child: Text(
                      item.description,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  ButtonCustomWidget(
                    onTap: () {
                      currenBolc.add(AddToCartEvent(
                        addToCartSendModel: AddToCartSendModel(
                          item: item,
                          sizeId: choicedSizeId ?? item.colors[0].id,
                          colorId: choicedColorId ?? item.sizes[0].id,
                        ),
                      ));
                    },
                    text: isAdded ? "Done Added" : "Add to your cart",
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _rowOfColors() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: item.colors
          .map(
            (e) => ColorCustomWidget(
              onColorTap: () {
                currenBolc.add(ChoiceColorEvent(colorId: e.id));
              },
              colorModel: e,
              choicedColorId: choicedColorId ?? item.colors[0].id,
            ),
          )
          .toList(),
    );
  }

  Widget _rowOfSizes() {
    return Padding(
        padding: const EdgeInsets.only(top: 20, bottom: 10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: item.sizes
              .map(
                (e) => SizeCustomWidget(
                  onSizeTap: () {
                    currenBolc.add(
                      ChoiceSizeEvent(sizeId: e.id),
                    );
                  },
                  sizeModel: e,
                  sizeChoiced: choicedSizeId ?? item.sizes[0].id,
                ),
              )
              .toList(),
        ));
  }

///////////////////////////////////////////////////////////
//////////////////// Helper methods ///////////////////////
///////////////////////////////////////////////////////////
  ProductScreenBloc get currenBolc => context.read<ProductScreenBloc>();
  void _getProductEvent() {
    currenBolc.add(LoadedProductEvent(itemId: widget.id));
  }
}
