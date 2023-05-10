import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

const List<Color> gradients = [
  Color(0xFF0EDED2),
  Color(0xFF03A0FE),
];

class ShoeItem extends StatelessWidget {
  final String imageUrl;
  final String snapchatUrl;
  final String price;
  final String brand;
  final String color;

  const ShoeItem({
    required this.imageUrl,
    required this.snapchatUrl,
    required this.price,
    required this.brand,
    required this.color,
  });

  Future _launchUrl() async {
    if (!await launch(snapchatUrl)) {
      throw Exception('Could not luanch $snapchatUrl');
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(30),
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
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            Container(
              width: 250,
              height: 140,
              decoration:
                  BoxDecoration(color: Color.fromARGB(255, 230, 235, 240)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(9),
                    child: Text('Price: $price', textScaleFactor: 1.3),
                  ),
                  const Spacer(),
                  Padding(
                    padding: EdgeInsets.all(9),
                    child: Text('Brand: $brand', textScaleFactor: 1.3),
                  ),
                  const Spacer(),
                  Padding(
                    padding: EdgeInsets.all(9),
                    child: Text('Colour: $color', textScaleFactor: 1.3),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
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
