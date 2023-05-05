// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:foot_gear/models/shoe.dart';
import '../dummy_data.dart';
import '../widgets/shoe_item.dart';

class TryOnShoes extends StatelessWidget {
  static const routeName = '/try-On-Shoes';

  const TryOnShoes({super.key});
  // final String categoryId;
  // final String categoryTitle;

  // tryOnShoes(this.categoryId, this.categoryTitle);

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];

    String imageUrl= '';
    String snapchatUrl= '';

    for (var shoe in DUMMY_SHOES) {
      if (shoe.id == categoryId) {
        imageUrl = shoe.imageUrl;
        snapchatUrl = shoe.snapchatUrl;
        break;
      }
    }
    print('Image URL: $imageUrl ---  Snapchat URL: $snapchatUrl');

    // final categoryShoes = DUMMY_SHOES.map((e) {
    //   return {'id': e.id, 'imageUrl': e.imageUrl, 'snapchatUrl': e.snapchatUrl};
    // }).toList();

    return Scaffold(
        appBar: AppBar(
          title: Text(categoryTitle!),
        ),
        body: ShoeItem(imageUrl: imageUrl, snapchatUrl: snapchatUrl,)

        // Center(
        //   child: Column(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     crossAxisAlignment: CrossAxisAlignment.center,

        //   ),
        // ),
        );
  }
}
