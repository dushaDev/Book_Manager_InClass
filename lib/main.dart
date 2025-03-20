import 'package:books_manager/bottom_navigation.dart';
import 'package:flutter/material.dart';

import 'bottom_nav/home.dart';
import 'bottom_nav/posts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Books Manager',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Books manager home page'),
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
  int _selectedIndex = 0;
  final _tabs = [const Home(), const Posts()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: _tabs[_selectedIndex],
     bottomNavigationBar: BottomNavigation(
       selectedIndex: _selectedIndex,
       onItemSelected: (int index) {
         setState(() {
           _selectedIndex = index;
         });
       },),
    );
  }
}
