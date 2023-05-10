import 'package:flutter/material.dart';
import '../screens/categoriesScreen.dart';
import '../screens/try_on_shoes.dart';
import '../components/homeBackground.dart';
import '../screens/feetSizePrediction.dart';
import '../components/homeAppbar.dart';

const List<Color> gradients = [
  Color(0xFF0EDED2),
  Color(0xFF03A0FE),
];

class MyHome extends StatelessWidget {
  const MyHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(),
      body: Stack(
        children: [
          Align(
            alignment: AlignmentDirectional.topEnd,
            child: Background(),
          ),
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height / 2.3),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 40.0, bottom: 10),
                  child: Text(
                    'Heyy THere!',
                    style: TextStyle(
                        fontSize: 30, color: Color.fromARGB(255, 74, 35, 90)),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                ),
                GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SizePrediction(
                                  title: 'title',
                                )),
                      );
                    },
                    child: roundedRectButton(
                      "Check Size",
                      gradients,
                    )),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CategoriesScreen()),
                    );
                  },
                  child: roundedRectButton(
                    "Try on?",
                    gradients,
                  ),
                ),
              ],
            ),
          ),
        ],
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
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  )),
            ],
          ),
        );
      },
    );
  }
}
