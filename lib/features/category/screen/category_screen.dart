import 'package:dress_store/features/Home/models/category_model.dart';
import 'package:dress_store/features/Home/widgets/products_sliver_grid_list_widget.dart';
import 'package:dress_store/features/category/bloc/bloc/category_screen_bloc.dart';
import 'package:dress_store/features/product/screen/product_screen.dart';
import 'package:dress_store/models/item_model.dart';
import 'package:dress_store/widgets/back_button_custom_widget.dart';
import 'package:dress_store/widgets/background_custom_widget.dart';
import 'package:dress_store/widgets/icon_favorite_button_custom.dart';
import 'package:dress_store/widgets/profile_custom_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key, required this.categoryModel});
  final CategoryModel categoryModel;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoryScreenBloc(),
      child: CategoryScreenWithBloc(categoryModel: categoryModel),
    );
  }
}

class CategoryScreenWithBloc extends StatefulWidget {
  const CategoryScreenWithBloc({super.key, required this.categoryModel});
  final CategoryModel categoryModel;

  @override
  State<CategoryScreenWithBloc> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreenWithBloc> {
  @override
  void initState() {
    _loadedData();
    super.initState();
  }

  List<ItemModel> itemModels = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffF8A3A7),
        leadingWidth: 100,
        leading: const BackButtonCustomWidget(),
        centerTitle: true,
        title: Text(
          widget.categoryModel.categoryName,
          style: const TextStyle(
            fontSize: 26,
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
          BlocListener<CategoryScreenBloc, CategoryScreenState>(
            listener: (context, state) {
              if (state is LoadedCategoryScreenDataSuccessfullyState) {
                itemModels = state.items;
              }

              if (state is OpenProductScreenState) {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return ProductScreen(itemId: state.itemId);
                }));
              }
            },
            child: BlocBuilder<CategoryScreenBloc, CategoryScreenState>(
                builder: (context, state) {
              if (state is LoadedCategoryScreenDataSuccessfullyState ||
                  state is ConvertItemToFavoriteState ||
                  state is OpenProductScreenState) {
                return Padding(
                  padding: const EdgeInsets.all(18),
                  child: CustomScrollView(
                    slivers: [
                      SliverToBoxAdapter(
                        child: _bestSelligDress(),
                      ),
                      ProductsSliverGridListWidget(
                        items: itemModels,
                        onFavPressed: (int indexOfItem, ItemModel itemModel) {
                          _addToFavEvent(indexOfItem, itemModel);
                        },
                        onTap: (int itemId) {
                          _openProductScreenEvent(itemId);
                        },
                      )
                    ],
                  ),
                );
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
            }),
          )
        ],
      ),
    );
  }

///////////////////////////////////////////////////////////
//////////////////// Helper methods ///////////////////////
///////////////////////////////////////////////////////////
  void _addToFavEvent(int indexOfItem, ItemModel itemModel) {
    currentBloc.add(AddToFavoriteEvent(index: indexOfItem, item: itemModel));
  }

  void _openProductScreenEvent(int itemId) {
    currentBloc.add(OPenProductScreenEvent(itemId: itemId));
  }

  void _loadedData() {
    currentBloc.add(LoadedCategoryScreenDataSuccessfullyEvent(
        id: widget.categoryModel.categoryId));
  }

  CategoryScreenBloc get currentBloc => context.read<CategoryScreenBloc>();

///////////////////////////////////////////////////////////
//////////////////// Widget methods ///////////////////////
///////////////////////////////////////////////////////////

  Widget _bestSelligDress() {
    return Column(
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
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: AssetImage(itemModels[0].image),
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
                  Expanded(
                    child: Text(
                      itemModels[0].name,
                      style: const TextStyle(
                          fontSize: 26, overflow: TextOverflow.ellipsis),
                    ),
                  ),
                  IconFavoriteButtonCustom(
                      itemModel: itemModels[0], onFavPressed: () {})
                ],
              ),
              Text(
                " ${itemModels[0].price} EGP",
                style: const TextStyle(fontSize: 16),
              )
            ],
          ),
        )
      ],
    );
  }
}
