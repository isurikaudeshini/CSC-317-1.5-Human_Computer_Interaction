import 'package:flutter/material.dart';

import '../models/category.dart';
import '../models/shoe.dart';

const DUMMY_CATEGORIES = [
  Category(
    id: 'c1',
    title: 'Nike Panda Sneakers',
    imageUrl: ('assets/images/shoe1.png'),
    // color: Colors.purple,
  ),
  Category(
    id: 'c2',
    title: 'Hush Puppies Trainers',
    imageUrl: ('assets/images/shoe2.png'),
    // color: Colors.red,
  ),
  Category(
    id: 'c3',
    title: 'Nike Air Force 1',
    imageUrl: ('assets/images/shoe3.png'),
    // color: Colors.orange,
  ),
  Category(
    id: 'c4',
    title: 'Olive Green Sneakers',
    imageUrl: ('assets/images/shoe4.png'),
    // color: Colors.amber,
  ),
  Category(
    id: 'c5',
    title: 'Keen Sneakers',
    imageUrl: ('assets/images/shoe5.png'),
    // color: Colors.blue,
  ),
  Category(
    id: 'c6',
    title: 'Gucci Ace Sneakers',
    imageUrl: ('assets/images/shoe6.png'),
    // color: Colors.green,
  ),
  Category(
    id: 'c7',
    title: 'Limelight Sneakers',
    imageUrl: ('assets/images/shoe7.png'),
    // color: Colors.lightBlue,
  ),
  Category(
    id: 'c8',
    title: 'Puma Sneaker',
    imageUrl: ('assets/images/shoe8.png'),
    // color: Colors.lightGreen,
  ),
  Category(
    id: 'c9',
    title: 'Black Sneaker',
    imageUrl: ('assets/images/shoe9.png'),
    // color: Colors.pink,
  ),
  Category(
    id: 'c10',
    title: 'Buckle Shoes',
    imageUrl: ('assets/images/shoe10.png'),
    //   color: Colors.teal,
  ),
];

const DUMMY_SHOES = [
  Shoe(
    id: 'c1',
    imageUrl: ('assets/images/shoe1.png'),
    snapchatUrl:
        'https://lens.snapchat.com/4394187f0b4c428c913656befdfcc633?share_id=BBCCa9fseJ4&locale=en-GB',
    price: ' 15 000 lkr',
    brand: 'Nike',
    color: 'Black White',
  ),
  Shoe(
    id: 'c2',
    imageUrl: ('assets/images/shoe2.png'),
    snapchatUrl:
        'https://lens.snapchat.com/35bc001ea386442ea1b7954527950c8e?share_id=N7eWayFqB1c&locale=en-GB',
    price: '31 984 lkr',
    brand: 'Hush Puppies',
    color: 'Brown',
  ),
  Shoe(
    id: 'c3',
    imageUrl: 'assets/images/shoe3.png',
    snapchatUrl:
        'https://lens.snapchat.com/9778fbf67b934b528354ae04734a5349?share_id=BoV9BIlTxQ8&locale=en-US',
    price: '34 841 lkr',
    brand: 'Nike',
    color: 'White',
  ),
  Shoe(
      id: 'c4',
      imageUrl: 'assets/images/shoe4.png',
      snapchatUrl:
          'https://lens.snapchat.com/f766d303b3e64f1ab0d60ee612d25073?share_id=dFG9KBquYlg&locale=en-US',
      price: '21 989 lkr',
      brand: 'Adidas',
      color: 'Moss Green'),
  Shoe(
    id: 'c5',
    imageUrl: 'assets/images/shoe5.png',
    snapchatUrl:
        'https://lens.snapchat.com/533cb2e67afe4ac7882f0e978616faf6?share_id=Q7tlRgt3aOo&locale=en-US',
    price: '33 891 lkr',
    brand: 'Keen',
    color: 'Brilliant Blue',
  ),
  Shoe(
    id: 'c6',
    imageUrl: 'assets/images/shoe6.png',
    snapchatUrl:
        'https://lens.snapchat.com/b74ece1a066a41099fc2ee4b1c1ce734?share_id=NCkVBRsp0AI&locale=en-US',
    price: '233 436 lkr',
    brand: 'Gucci',
    color: 'White',
  ),
  Shoe(
    id: 'c7',
    imageUrl: 'assets/images/shoe7.png',
    snapchatUrl:
        'https://lens.snapchat.com/2b55212ec54e4ae4b8d6dbed92c794c4?share_id=DFMxNZTkoWc&locale=en-US',
    price: '57 009 lkr',
    brand: 'Cloudultra',
    color: 'Limelight',
  ),
  Shoe(
    id: 'c8',
    imageUrl: 'assets/images/shoe8.png',
    snapchatUrl:
        'https://lens.snapchat.com/751d81352ba148219735365d117a8902?share_id=ZBlZJOUG1PE&locale=en-US',
    price: '28 186 lkr',
    brand: 'Puma',
    color: 'Black',
  ),
  Shoe(
    id: 'c9',
    imageUrl: 'assets/images/shoe9.png',
    snapchatUrl:
        'https://lens.snapchat.com/6b6c828724594ce59f6a159862b2b464?share_id=dG8TYuZq01A&locale=en-US',
    price: '34 667 lkr',
    brand: 'Brandless',
    color: 'Black',
  ),
  Shoe(
    id: 'c10',
    imageUrl: 'assets/images/shoe10.png',
    snapchatUrl:
        'https://lens.snapchat.com/08f33f4b75ba4f97aa6e90587a12fb5e?share_id=algEhX_U5s8&locale=en-US',
    price: '44 776 lkr',
    brand: 'Oxford',
    color: 'Black',
  ),
];
