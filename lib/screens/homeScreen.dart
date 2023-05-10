import 'package:flutter/material.dart';
import '../screens/categoriesScreen.dart';
import '../screens/try_on_shoes.dart';
import '../screens/feetSizePrediction.dart';
import '../components/homeAppbar.dart';

const List<Color> signInGradients = [
  Color(0xFF0EDED2),
  Color(0xFF03A0FE),
];

class MyHome extends StatelessWidget {
  const MyHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height / 2.3)),
            Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(left: 40.0, bottom: 10),
                      child: Text(
                        'Heyy THere!',
                        style: TextStyle(
                            fontSize: 30,
                            color: Color.fromARGB(255, 74, 35, 90)),
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(bottom: 50)),
                  ],
                )
              ],
            ),
            const Padding(padding: EdgeInsets.only(bottom: 50)),
            roundedRectButton(
              "Check Size",
              signInGradients, false
            ),
            const Padding(padding: EdgeInsets.only(bottom: 50)),
            roundedRectButton(
              "Try on?",
              signInGradients, false
            ),

            // Expanded(
            //   child: Center(
            //     child: Padding(
            //       padding: const EdgeInsets.all(8.0),
            //       child: Column(
            //         mainAxisAlignment: MainAxisAlignment.center,
            //         crossAxisAlignment: CrossAxisAlignment.stretch,
            //         children: <Widget>[
            //           ElevatedButton(
            //             onPressed: () {
            //               Navigator.push(
            //                 context,
            //                 MaterialPageRoute(
            //                     builder: (context) => const SizePrediction(
            //                           title: 'title',
            //                         )),
            //               );
            //             },
            //             child: const Text("Check Size"),
            //           ),
            //           Card(
            //             shape: RoundedRectangleBorder(
            //               borderRadius: BorderRadius.circular(80),
            //             ),
            //           ),
            //           const SizedBox(
            //             height: 60,
            //           ),
            //           ElevatedButton(
            //               style: ElevatedButton.styleFrom(),
            //               onPressed: () {
            //                 Navigator.push(
            //                   context,
            //                   MaterialPageRoute(
            //                       builder: (context) => CategoriesScreen()),
            //                 );
            //               },
            //               child: const Text("Try on?")),
            //         ],
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  Widget roundedRectButton(
  String title, List<Color> gradient, bool isEndIconVisible){
    return Builder(
        builder: (BuildContext mContext){
          return Padding
          (padding: EdgeInsets.only(bottom: 10),
          child: Stack(
            alignment: Alignment(1.0, 0.0),
            children: [
              Container(
                alignment: Alignment.center,
                width: MediaQuery.of(mContext).size.width / 1.7,
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)
                  ),
                  gradient: LinearGradient(
                    colors: gradient,
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight
                  )
                ),
                child: Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w500),                  
                ),
                padding: EdgeInsets.only(top: 16, bottom: 16),
              ),
              Visibility(
                visible: isEndIconVisible,
                child: Padding(
                  padding: const EdgeInsets.only(right:10.0),
                  child: ImageIcon(
                    AssetImage("assets/ic_forward.png"),
                    size: 30,
                    color: Colors.white,
                  ),
                ),
              )

            ],
          ),

          );
        },
    );
  }
}
