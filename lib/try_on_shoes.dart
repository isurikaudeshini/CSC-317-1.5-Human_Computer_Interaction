import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'package:flutter/material.dart';

class tryOnShoes extends StatelessWidget {
  static const routeName = '/try-On-Shoes';
  // final String categoryId;
  // final String categoryTitle;

  // tryOnShoes(this.categoryId, this.categoryTitle);

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle!),
      ),
      body: Center(
        child: Text("Name of the shoe - Shoe 1"),
      ),
    );
  }
}
