import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import '../screens/categoriesScreen.dart';
import '../components/homeBackground.dart';
import '../screens/feetSizePrediction.dart';
import '../components/homeAppbar.dart';

const List<Color> gradients = [
  Color(0xFF0EDED2),
  Color(0xFF03A0FE),
];

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  late StreamSubscription subscription;

  var isDeviceConnected = false;

  bool isAlertSet = false;

  @override
  void initState() {
    getConnectivity();
    super.initState();
  }

  getConnectivity() => subscription = Connectivity()
          .onConnectivityChanged
          .listen((ConnectivityResult result) async {
        isDeviceConnected = await InternetConnectionChecker().hasConnection;
        if (!isDeviceConnected && isAlertSet == false) {
          showDialogBox();
          setState(() => isAlertSet = true);
        }
      });
  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }

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
                  padding: EdgeInsets.only(left: 40.0, bottom: 7),
                  child: Text(
                    'Hey There!',
                    style: TextStyle(
                        fontSize: 38, color: Color.fromARGB(255, 74, 35, 90)),
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
                                  title: 'Check Size',
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

  showDialogBox() => showCupertinoDialog<String>(
        context: context,
        builder: (BuildContext context) => CupertinoAlertDialog(
          title: const Text('No Connection'),
          content: const Text('Please check your internet connectivity'),
          actions: <Widget>[
            TextButton(
                onPressed: () async {
                  Navigator.pop(context, 'Cancel');
                  setState(() => isAlertSet = false);
                  isDeviceConnected =
                      await InternetConnectionChecker().hasConnection;
                  if (!isDeviceConnected && isAlertSet == false) {
                    showDialogBox();
                    print('not connected');
                    setState(() => isAlertSet = true);
                  }
                },
                child: const Text('OK')),
          ],
        ),
      );

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
