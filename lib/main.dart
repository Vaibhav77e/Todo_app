import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import './screens/homepage.dart';

void main() async {
  //initialize the hive local database
  Hive.initFlutter;
  // open a box
  var box = Hive.openBox('mybox');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Homepage(),
      theme: ThemeData(primarySwatch: Colors.yellow),
    );
  }
}
