import 'package:dress_store/demo_data.dart';
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
  //final int categoryId;
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
    currentBloc.add(LoadedCategoryScreenDataSuccessfullyEvent(
        id: widget.categoryModel.categoryId));
    super.initState();
  }

  List<ItemModel> itemModels = [];
  bool isFav = false;
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
              if (state is ConvertItemToFavoriteState) {
                isFav = state.isFavorte;
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
                                    image:
                                        AssetImage("assets/images/itme8.webp"),
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
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
                                              price: 99,
                                              categoryId: 3),
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
                        items: itemModels,
                        isFavorite: isFav,
                        onFavPressed: (int indexOfItem, ItemModel itemModel) {
                          currentBloc.add(AddToFavoriteEvent(
                              index: indexOfItem, item: itemModel));
                        },
                        onTap: (int itemId) {
                          currentBloc
                              .add(OPenProductScreenEvent(itemId: itemId));
                        },
                      )
                    ],
                  ),
                );
              } else {
                return SizedBox();
              }
            }),
          )
        ],
      ),
    );
  }

  CategoryScreenBloc get currentBloc => context.read<CategoryScreenBloc>();
}
