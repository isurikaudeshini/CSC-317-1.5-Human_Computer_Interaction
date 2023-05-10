import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foot_gear/screens/homeScreen.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'screens/categoriesScreen.dart';
import 'screens/try_on_shoes.dart';
import 'screens/feetSizePrediction.dart';
import 'components/homeAppbar.dart';
import 'utils/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late StreamSubscription subcription;

  var isDeviceConnected = false;

  bool isAlertSet = false;

  @override
  void initState() {
    getConnectivity();
    super.initState();
  }

  getConnectivity() => subcription = Connectivity()
          .onConnectivityChanged
          .listen((ConnectivityResult result) async {
        isDeviceConnected = await InternetConnectionChecker().hasConnection;
        if (!isDeviceConnected && isAlertSet == false) {
          showDialogBox();
          setState(() => isAlertSet = true);
        }
      });

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Foot Gear',
      theme: ThemeData(
        primarySwatch: darkBlueSwatch,
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
            bodyLarge: const TextStyle(color: Colors.black),
            bodyMedium: const TextStyle(color: Colors.black),
            titleLarge: const TextStyle(
              fontSize: 24,
              fontFamily: 'RobotoCondensed',
            )),
      ),
      // home: const MyHomePage(title: 'Foot Gear'),
      initialRoute: '/',
      routes: {
        '/': (context) => const MyHomePage(title: 'Foot Gear'),
        TryOnShoes.routeName: (context) => TryOnShoes(),
      },
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
                  if (!isDeviceConnected) {
                    showDialogBox();
                    print('not connected');
                    setState(() => isAlertSet = true);
                  }
                },
                child: const Text('OK')),
          ],
        ),
      );
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int myIndex = 0;
  int index = 0;
  List<Widget> widgetList = [
    const MyHome(),
    CategoriesScreen(),
    SizePrediction(title: 'Check Size')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        children: widgetList,
        index: myIndex,
      ),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Color(0xFF1976D2),
          showUnselectedLabels: false,
          type: BottomNavigationBarType.shifting,
          onTap: (index) {
            setState(() {
              myIndex = index;
            });
          },
          currentIndex: myIndex,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
                backgroundColor: Color.fromARGB(255, 93, 173, 226)),
            BottomNavigationBarItem(
                icon: Icon(Icons.shop),
                label: 'Try On',
                backgroundColor: Color.fromARGB(255, 93, 173, 226)),
            BottomNavigationBarItem(
                icon: Icon(Icons.straighten),
                label: 'Check Size',
                backgroundColor: Color.fromARGB(255, 93, 173, 226)),
          ]),
    );
  }
}
