import 'package:flutter/material.dart';
import 'package:foot_gear/screens/homeScreen.dart';
import 'screens/categoriesScreen.dart';
import 'screens/try_on_shoes.dart';
import 'screens/feetSizePrediction.dart';
import 'components/homeAppbar.dart';
import 'utils/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
          backgroundColor: Color.fromARGB(255, 3, 160, 254),
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
