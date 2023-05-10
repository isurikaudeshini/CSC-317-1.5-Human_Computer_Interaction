// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '../data/dummy_data.dart';
import '../widgets/shoe_item.dart';
import '../theme/custom_app_theme.dart';
import '../components/tryOnAppbar.dart';

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

    String imageUrl = '';
    String snapchatUrl = '';
    String price = '';
    String brand = '';
    String color = '';

    for (var shoe in DUMMY_SHOES) {
      if (shoe.id == categoryId) {
        imageUrl = shoe.imageUrl;
        snapchatUrl = shoe.snapchatUrl;
        price = shoe.price;
        brand = shoe.brand;
        color = shoe.color;

        break;
      }
    }
    print('Image URL: $imageUrl ---  Snapchat URL: $snapchatUrl');

    // final categoryShoes = DUMMY_SHOES.map((e) {
    //   return {'id': e.id, 'imageUrl': e.imageUrl, 'snapchatUrl': e.snapchatUrl};
    // }).toList();

    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Color(0xFF1976D2),
          centerTitle: true,
          title: Text(
            categoryTitle!,
            style: AppThemes.detailsAppBar,
          ),
          // automaticallyImplyLeading: false,
        ),
        body: ShoeItem(
          imageUrl: imageUrl,
          snapchatUrl: snapchatUrl,
          price: price,
          brand: brand,
          color: color,

        )

        // Center(
        //   child: Column(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     crossAxisAlignment: CrossAxisAlignment.center,

        //   ),
        // ),
        );
  }
}
