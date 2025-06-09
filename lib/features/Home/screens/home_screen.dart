import 'package:dress_store/features/Home/bloc/home_screen_bloc.dart';
import 'package:dress_store/features/cart/screen/cart_screen.dart';
import 'package:dress_store/models/item_model.dart';
import 'package:dress_store/features/Home/widgets/category_list.dart';
import 'package:dress_store/features/Home/widgets/products_sliver_grid_list_widget.dart';
import 'package:dress_store/features/product/screen/product_screen.dart';
import 'package:dress_store/widgets/background_custom_widget.dart';
import 'package:dress_store/widgets/profile_custom_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeScreenBloc(),
      child: const HomeScreenWithBloc(),
    );
  }
}

bool isFavorite = false;
late List<ItemModel> items;

class HomeScreenWithBloc extends StatefulWidget {
  const HomeScreenWithBloc({super.key});

  @override
  State<HomeScreenWithBloc> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreenWithBloc> {
  @override
  void initState() {
    super.initState();
    _openHomeScreenEvent();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeScreenBloc, HomeScreenState>(
      listener: (context, state) {
        if (state is ConvertItemToFavoriteState) {
          isFavorite = state.isFavorte;
        }
        if (state is LoadedHomeScreenDataSuccessfullyState) {
          items = state.items;
        }
        if (state is OpenCartScreenState) {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return const CartScreen();
          }));
        }
        if (state is OpenProductScreenState) {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return ProductScreen(itemId: state.itemId);
          }));
        }
      },
      child: Scaffold(
        extendBody: true,
        bottomNavigationBar: _bottomNavigationBarWidget(),
        body: _pageContent(),
      ),
    );
  }

///////////////////////////////////////////////////////////
//////////////////// Widget methods ///////////////////////
///////////////////////////////////////////////////////////
  Widget _bottomNavigationBarWidget() {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(40), topRight: Radius.circular(40)),
      child: BottomNavigationBar(fixedColor: const Color(0xffF8A3A7), items: [
        BottomNavigationBarItem(
          label: "",
          icon: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.home,
                size: 40,
              )),
        ),
        BottomNavigationBarItem(
          label: '',
          icon: IconButton(
              onPressed: () {
                currentBloc.add(OpenCartScreenEvent());
              },
              icon: const Icon(
                Icons.shopping_cart,
                size: 40,
              )),
        ),
        BottomNavigationBarItem(
          label: "",
          icon: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.person,
                size: 40,
              )),
        )
      ]),
    );
  }

  Widget _pageContent() {
    return Stack(children: [
      const BackgroundCustomWidget(),
      SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
        child: Column(
          children: [
            _homeHeaderWidget(),
            _homeBodyWidget(),
          ],
        ),
      ))
    ]);
  }

  Widget _homeHeaderWidget() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(
              backgroundColor: Colors.white,
              radius: 25,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.apps,
                  size: 32,
                ),
              ),
            ),
            const ProfileCustomWidget(),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 23, top: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Text(
                  "Find Your Prefect Dress",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(vertical: 16),
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: const Icon(
                    Icons.search,
                    color: Color(0xffA7A3A3),
                  ),
                  hintText: "Search",
                  hintStyle: const TextStyle(
                    color: Color(0xffA7A3A3),
                    fontSize: 16,
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _homeBodyWidget() {
    return BlocBuilder<HomeScreenBloc, HomeScreenState>(
      builder: (context, state) {
        if (state is LoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is LoadedHomeScreenDataSuccessfullyState ||
            state is ConvertItemToFavoriteState ||
            state is OpenProductScreenState ||
            state is OpenCartScreenState) {
          return Expanded(
              child: CustomScrollView(
            slivers: [
              const SliverToBoxAdapter(
                child: Text("Category",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 6,
                ),
              ),
              const SliverToBoxAdapter(
                child: CategoryList(),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 20,
                ),
              ),
              ProductsSliverGridListWidget(
                  onTap: (itemId) {
                    _oPenProductScreenEvent(itemId);
                  },
                  onFavPressed: (indexOfItem, itemModel) {
                    _addToFavoriteEvent(indexOfItem, itemModel);
                  },
                  isFavorite: isFavorite,
                  items: items),
            ],
          ));
        } else {
          return const SizedBox();
        }
      },
    );
  }

///////////////////////////////////////////////////////////
//////////////////// Helper methods ///////////////////////
///////////////////////////////////////////////////////////
  HomeScreenBloc get currentBloc => context.read<HomeScreenBloc>();
  void _openHomeScreenEvent() {
    currentBloc.add(OpenHomeScreenEvent());
  }

  void _addToFavoriteEvent(int indexOfItem, ItemModel itemModel) {
    currentBloc.add(AddToFavoriteEvent(index: indexOfItem, item: itemModel));
  }

  void _oPenProductScreenEvent(int itemId) {
    currentBloc.add(OPenProductScreenEvent(itemId: itemId));
  }
}
