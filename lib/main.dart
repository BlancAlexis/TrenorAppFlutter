import 'package:flutter/material.dart';

import 'categorizedTrend.dart';
import 'detailsPage.dart';
import 'homePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutmerde'),
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
int _currentIndex=0;

final List<Widget> _tabs = [
  HomePage(),
  CategorizedTrend(),
];
  @override
  Widget build(BuildContext context) {
    const tmdbApiKey = String.fromEnvironment('TENOR_API_KEY');
 /*   if (tmdbApiKey.isEmpty) {
      throw AssertionError('TMDB_KEY is not set');
    }*/
    return Scaffold(
      appBar: AppBar(
        title: Text('Flut'),
      ),
      body: _tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Catégorie',
          ),
        ],
      ),
    );
  }
}