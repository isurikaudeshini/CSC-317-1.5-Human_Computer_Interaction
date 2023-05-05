import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

final _url =
    'https://lens.snapchat.com/4394187f0b4c428c913656befdfcc633?share_id=BBCCa9fseJ4&locale=en-GB';


class ShoeItem extends StatelessWidget {
  final String imageUrl;
  final String snapchatUrl;

  const ShoeItem({required this.imageUrl, required this.snapchatUrl});

  Future _launchUrl() async {
  if (!await launch(snapchatUrl)) {
    throw Exception('Could not luanch $_url');
  }
}

  void selectShoe() {}

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: selectShoe,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
              child: Image.asset(
                imageUrl,  //image
                height: 300,
                width: double.infinity, fit: BoxFit.cover,
              ),
            ),
            OutlinedButton(
              onPressed: _launchUrl,
              child: const Text('Try AR filter'),
            ),
          ],
        ),
        
      ),
      
    );
  }
}


