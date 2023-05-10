import 'package:flutter/material.dart';

import '../dummy_data.dart';
import '../widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  // const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Foot Gear'),
        ),
        body: ListView(
          scrollDirection: Axis.vertical,
          children: DUMMY_CATEGORIES
              .map((catData) => CategoryItem(
                    catData.id,
                    catData.title,
                    catData.imageUrl
                  ))
              .toList(),
        )

        // GridView(
        //   padding: const EdgeInsets.all(25),
        //   gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        //     maxCrossAxisExtent: 200,
        //     childAspectRatio: 3 / 2,
        //     crossAxisSpacing: 20,
        //     mainAxisSpacing: 20,
        //   ),
        //   children: DUMMY_CATEGORIES
        //       .map((catData) => CategoryItem(
        //             catData.id,
        //             catData.title,
        //             catData.color,
        //           ))
        //       .toList(),
        // ),
        );
  }
}
