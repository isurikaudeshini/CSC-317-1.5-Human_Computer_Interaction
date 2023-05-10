import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

const List<Color> gradients = [
  Color(0xFF0EDED2),
  Color(0xFF03A0FE),
];

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
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 1.0)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  imageUrl, //image
                  height: 300,
                  width: double.infinity,
                ),
              ),
            ),

            // OutlinedButton(
            //   onPressed: _launchUrl,
            //   child: const Text('Try AR filter'),
            // ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.2,
            ),
            GestureDetector(
              onTap: _launchUrl,
              child: roundedRectButton(
                "Try AR filter?",
                gradients,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget roundedRectButton(
    String title,
    List<Color> gradient,
  ) {
    return Builder(
      builder: (BuildContext mContext) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Stack(
            alignment: const Alignment(1.0, 0.0),
            children: [
              Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(mContext).size.width / 1.7,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    gradient: LinearGradient(
                        colors: gradient,
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight),
                  ),
                  padding: const EdgeInsets.only(top: 16, bottom: 16),
                  child: Text(
                    title,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  )),
            ],
          ),
        );
      },
    );
  }
}
