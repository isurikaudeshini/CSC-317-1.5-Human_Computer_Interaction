import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'package:flutter/material.dart';

class categoryShoes extends StatelessWidget {
  const categoryShoes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shoe try ons"),
      ),
      body: Center(
        child: Text("Name of the shoe - Shoe 1"),
      ),
    );
  }
}
