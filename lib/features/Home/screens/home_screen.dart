import 'package:dress_store/features/Home/widgets/category_list.dart';
import 'package:dress_store/features/Home/widgets/items_grid.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: const _ButtomNavigationBarWidget(),
      body: Stack(children: [
        const Positioned.fill(
          child: DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xffF8A3A7), Color(0xffFCFCFC)],
              ),
            ),
          ),
        ),
        SafeArea(
            child: Padding(
          padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                  const CircleAvatar(
                    backgroundImage: AssetImage('assets/images/profile .jpg'),
                    radius: 25,
                  ),
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
                        contentPadding:
                            const EdgeInsets.symmetric(vertical: 16),
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
              const Expanded(
                  child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Text("Category",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                  ),
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: 6,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: CategoryList(),
                  ),
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: 20,
                    ),
                  ),
                  ItemsGrid(),
                ],
              )),
            ],
          ),
        ))
      ]),
    );
  }
}

class _ButtomNavigationBarWidget extends StatelessWidget {
  const _ButtomNavigationBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(40), topRight: Radius.circular(40)),
      child: BottomNavigationBar(fixedColor: Color(0xffF8A3A7), items: [
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
              onPressed: () {},
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
}
