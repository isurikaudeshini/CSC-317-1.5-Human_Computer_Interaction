import 'package:flutter/material.dart';
import 'screens/categoriesScreen.dart';
import 'screens/try_on_shoes.dart';
import 'screens/feetSizePrediction.dart';
import './colors.dart';

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
        canvasColor: const Color.fromARGB(255, 239, 234, 206),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Welcome to my App',
            style: TextStyle(fontSize: 42, color: Colors.blueAccent[700]),
          ),
          Expanded(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SizePrediction(
                                    title: 'title',
                                  )),
                        );
                      },
                      child: const Text("Check Size"),
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(80),
                      ),
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CategoriesScreen()),
                          );
                        },
                        child: const Text("Try on?")),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: const Icon(Icons.help),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
