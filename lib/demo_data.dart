import 'package:dress_store/features/Home/models/category_model.dart';
import 'package:dress_store/models/add_to_cart_send_model.dart';
import 'package:dress_store/models/color_model.dart';
import 'package:dress_store/models/item_model.dart';
import 'package:dress_store/models/size_model.dart';
import 'package:flutter/material.dart';

class DemoData {

 static  List<CategoryModel> categories = const [
    CategoryModel(categoryName: "All", categoryId: 1),
    CategoryModel(categoryName: "Mini Dresses", categoryId: 2),
    CategoryModel(categoryName: "Midi Dresses", categoryId: 3),
    CategoryModel(categoryName: "Maxi Dresses", categoryId: 4),
  ];
  static List<AddToCartSendModel> cartItems = [];
  static List<ItemModel> items = [
    ItemModel(
        id: 1,
        image: "assets/images/item1.webp",
        name: "Kendry Gdsxvx",
        price: 5133,
        description:
            "The dress strapless  Its elegant silhouette is enhanced by a large bow detail, adding a touch of .",
        sizes: [
          SizeModel(size: 'XS', id: 1),
          SizeModel(size: 'S', id: 2),
          SizeModel(size: 'M', id: 3),
          SizeModel(size: 'L', id: 4),
        ],
        colors: [
          ColorModel(color: Colors.black, id: 1),
          ColorModel(color: Colors.white, id: 2),
          ColorModel(color: Colors.orange, id: 3)
        ],
        categoryId: 4),
    ItemModel(
        id: 2,
        image: "assets/images/item2.webp",
        name: "Kendry Gdsxvx",
        price: 2133,
        description:
            "The dress strapless  Its elegant silhouette is enhanced by a large bow detail, adding a touch of .",
        sizes: [
          SizeModel(size: 'XS', id: 1),
          SizeModel(size: 'S', id: 2),
          SizeModel(size: 'M', id: 3),
          SizeModel(size: 'L', id: 4),
        ],
        colors: [
          ColorModel(color: Colors.black, id: 1),
          ColorModel(color: Colors.white, id: 2),
          ColorModel(color: Colors.orange, id: 3)
        ],
        categoryId: 2),
    ItemModel(
        id: 3,
        image: "assets/images/item3.webp",
        name: "Kendry Gdsxvx",
        price: 213,
        description:
            "The dress strapless  Its elegant silhouette is enhanced by a large bow detail, adding a touch of .",
        sizes: [
          SizeModel(size: 'XS', id: 1),
          SizeModel(size: 'S', id: 2),
          SizeModel(size: 'M', id: 3),
          SizeModel(size: 'L', id: 4),
        ],
        colors: [
          ColorModel(color: Colors.black, id: 1),
          ColorModel(color: Colors.white, id: 2),
          ColorModel(color: Colors.orange, id: 3)
        ],
        categoryId: 2),
    ItemModel(
        id: 4,
        image: "assets/images/item4.webp",
        name: "Kendry Gdsxvx",
        price: 2.1333,
        description:
            "The dress strapless  Its elegant silhouette is enhanced by a large bow detail, adding a touch of .",
        sizes: [
          SizeModel(size: 'XS', id: 1),
          SizeModel(size: 'S', id: 2),
          SizeModel(size: 'M', id: 3),
          SizeModel(size: 'L', id: 4),
        ],
        colors: [
          ColorModel(color: Colors.black, id: 1),
          ColorModel(color: Colors.white, id: 2),
          ColorModel(color: Colors.orange, id: 3)
        ],
        categoryId: 4),
    ItemModel(
        id: 5,
        image: "assets/images/item5.webp",
        name: "Kendry Gdsxvx",
        price: 233,
        description:
            "The dress strapless  Its elegant silhouette is enhanced by a large bow detail, adding a touch of .",
        sizes: [
          SizeModel(size: 'XS', id: 1),
          SizeModel(size: 'S', id: 2),
          SizeModel(size: 'M', id: 3),
          SizeModel(size: 'L', id: 4),
        ],
        colors: [
          ColorModel(color: Colors.black, id: 1),
          ColorModel(color: Colors.white, id: 2),
          ColorModel(color: Colors.orange, id: 3)
        ],
        categoryId: 2),
    ItemModel(
        id: 6,
        image: "assets/images/item1.webp",
        name: "Kendry Gdsxvx",
        price: 2133,
        description:
            "The dress strapless  Its elegant silhouette is enhanced by a large bow detail, adding a touch of .",
        sizes: [
          SizeModel(size: 'XS', id: 1),
          SizeModel(size: 'S', id: 2),
          SizeModel(size: 'M', id: 3),
          SizeModel(size: 'L', id: 4),
        ],
        colors: [
          ColorModel(color: Colors.black, id: 1),
          ColorModel(color: Colors.white, id: 2),
          ColorModel(color: Colors.orange, id: 3)
        ],
        categoryId: 4),
    ItemModel(
      categoryId: 2,
      id: 7,
      image: 'assets/images/mini1.webp',
      colors: [
        ColorModel(color: Colors.black, id: 1),
        ColorModel(color: Colors.white, id: 2),
        ColorModel(color: Colors.orange, id: 3)
      ],
      description: "bcjkasdjskmksxllsx",
      sizes: [
        SizeModel(size: 'XS', id: 1),
        SizeModel(size: 'S', id: 2),
        SizeModel(size: 'M', id: 3),
        SizeModel(size: 'L', id: 4),
      ],
      name: "Kendry Gdsxvx",
      price: 888,
    ),
    ItemModel(
        categoryId: 2,
        id: 8,
        image: 'assets/images/mini2.webp',
        colors: [
          ColorModel(color: Colors.black, id: 1),
          ColorModel(color: Colors.white, id: 2),
          ColorModel(color: Colors.orange, id: 3)
        ],
        description: "bcjkasdjskmksxllsx",
        sizes: [
          SizeModel(size: 'XS', id: 1),
          SizeModel(size: 'S', id: 2),
          SizeModel(size: 'M', id: 3),
          SizeModel(size: 'L', id: 4),
        ],
        name: "Kendry Gdsxvx",
        price: 848),
    ItemModel(
        categoryId: 2,
        id: 9,
        image: 'assets/images/mini3.webp',
        colors: [
          ColorModel(color: Colors.black, id: 1),
          ColorModel(color: Colors.white, id: 2),
          ColorModel(color: Colors.orange, id: 3)
        ],
        description: "bcjkasdjskmksxllsx",
        sizes: [
          SizeModel(size: 'XS', id: 1),
          SizeModel(size: 'S', id: 2),
          SizeModel(size: 'M', id: 3),
          SizeModel(size: 'L', id: 4),
        ],
        name: "Kendry Gdsxvx",
        price: 888),
    ItemModel(
        categoryId: 2,
        id: 10,
        image: 'assets/images/mini4.webp',
        colors: [
          ColorModel(color: Colors.black, id: 1),
          ColorModel(color: Colors.white, id: 2),
          ColorModel(color: Colors.orange, id: 3)
        ],
        description: "bcjkasdjskmksxllsx",
        sizes: [
          SizeModel(size: 'XS', id: 1),
          SizeModel(size: 'S', id: 2),
          SizeModel(size: 'M', id: 3),
          SizeModel(size: 'L', id: 4),
        ],
        name: "Kendry Gdsxvx",
        price: 888),
    ItemModel(
        categoryId: 2,
        id: 11,
        image: 'assets/images/mini5.webp',
        colors: [
          ColorModel(color: Colors.black, id: 1),
          ColorModel(color: Colors.white, id: 2),
          ColorModel(color: Colors.orange, id: 3)
        ],
        description: "bcjkasdjskmksxllsx",
        sizes: [
          SizeModel(size: 'XS', id: 1),
          SizeModel(size: 'S', id: 2),
          SizeModel(size: 'M', id: 3),
          SizeModel(size: 'L', id: 4),
        ],
        name: "Kendry Gdsxvx",
        price: 888),
    ItemModel(
        categoryId: 2,
        id: 12,
        image: 'assets/images/mini6.webp',
        colors: [
          ColorModel(color: Colors.black, id: 1),
          ColorModel(color: Colors.white, id: 2),
          ColorModel(color: Colors.orange, id: 3)
        ],
        description: "bcjkasdjskmksxllsx",
        sizes: [
          SizeModel(size: 'XS', id: 1),
          SizeModel(size: 'S', id: 2),
          SizeModel(size: 'M', id: 3),
          SizeModel(size: 'L', id: 4),
        ],
        name: "Kendry Gdsxvx",
        price: 8448),
    ItemModel(
        categoryId: 3,
        id: 13,
        image: 'assets/images/midi1.webp',
        colors: [
          ColorModel(color: Colors.black, id: 1),
          ColorModel(color: Colors.white, id: 2),
          ColorModel(color: Colors.orange, id: 3)
        ],
        description: "bcjkasdjskmksxllsx",
        sizes: [
          SizeModel(size: 'XS', id: 1),
          SizeModel(size: 'S', id: 2),
          SizeModel(size: 'M', id: 3),
          SizeModel(size: 'L', id: 4),
        ],
        name: "Kendry Gdsxvx",
        price: 777),
    ItemModel(
        categoryId: 3,
        id: 14,
        image: 'assets/images/midi2.webp',
        colors: [
          ColorModel(color: Colors.black, id: 1),
          ColorModel(color: Colors.white, id: 2),
          ColorModel(color: Colors.orange, id: 3)
        ],
        description: "bcjkasdjskmksxllsx",
        sizes: [
          SizeModel(size: 'XS', id: 1),
          SizeModel(size: 'S', id: 2),
          SizeModel(size: 'M', id: 3),
          SizeModel(size: 'L', id: 4),
        ],
        name: "Kendry Gdsxvx",
        price: 888),
    ItemModel(
        categoryId: 3,
        id: 15,
        image: 'assets/images/midi3.webp',
        colors: [
          ColorModel(color: Colors.black, id: 1),
          ColorModel(color: Colors.white, id: 2),
          ColorModel(color: Colors.orange, id: 3)
        ],
        description: "bcjkasdjskmksxllsx",
        sizes: [
          SizeModel(size: 'XS', id: 1),
          SizeModel(size: 'S', id: 2),
          SizeModel(size: 'M', id: 3),
          SizeModel(size: 'L', id: 4),
        ],
        name: "Kendry Gdsxvx",
        price: 888),
    ItemModel(
        categoryId: 3,
        id: 16,
        image: 'assets/images/midi4.webp',
        colors: [
          ColorModel(color: Colors.black, id: 1),
          ColorModel(color: Colors.white, id: 2),
          ColorModel(color: Colors.orange, id: 3)
        ],
        description: "bcjkasdjskmksxllsx",
        sizes: [
          SizeModel(size: 'XS', id: 1),
          SizeModel(size: 'S', id: 2),
          SizeModel(size: 'M', id: 3),
          SizeModel(size: 'L', id: 4),
        ],
        name: "Kendry Gdsxvx",
        price: 1188),
    ItemModel(
        categoryId: 3,
        id: 17,
        image: 'assets/images/midi5.webp',
        colors: [
          ColorModel(color: Colors.black, id: 1),
          ColorModel(color: Colors.white, id: 2),
          ColorModel(color: Colors.orange, id: 3)
        ],
        description: "bcjkasdjskmksxllsx",
        sizes: [
          SizeModel(size: 'XS', id: 1),
          SizeModel(size: 'S', id: 2),
          SizeModel(size: 'M', id: 3),
          SizeModel(size: 'L', id: 4),
        ],
        name: "Kendry Gdsxvx",
        price: 86878),
  ];
}
