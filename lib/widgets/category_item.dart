import 'package:flutter/material.dart';
import 'package:foot_gear/screens/try_on_shoes.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;

  const CategoryItem(this.id, this.title, this.imageUrl, {super.key});

  void selectCategory(BuildContext context) {
    Navigator.of(context).pushNamed(
      TryOnShoes.routeName,
      arguments: {'id': id, 'title': title, 'imageUrl': imageUrl},
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () => selectCategory(context),
        splashColor: Theme.of(context).primaryColor,
        child: Padding(
          padding: EdgeInsets.all(40.0),
          child: Container(
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 105, 170, 224),
                borderRadius: BorderRadius.circular(10)),
            child: Image.asset(imageUrl),
            width: 200,
            height: 200,
          ),
        ));

    // InkWell(
    //   onTap: () => selectCategory(context),
    //   splashColor: Theme.of(context).primaryColor,
    //   borderRadius: BorderRadius.circular(15),
    //   child: Container(
    //     padding: const EdgeInsets.all(15),
    //     child: Text(
    //       title,
    //       style: Theme.of(context).textTheme.titleLarge,
    //     ),
    //     decoration: BoxDecoration(
    //         gradient: LinearGradient(
    //           colors: [
    //             Colors.orange.withOpacity(0.01),
    //             Colors.orange,
    //           ],
    //           begin: Alignment.topLeft,
    //           end: Alignment.bottomRight,
    //         ),
    //         borderRadius: BorderRadius.circular(15)),
    //   ),
    // );
  }
}
