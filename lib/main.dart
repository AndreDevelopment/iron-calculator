import 'package:flutter/material.dart';

import './widgets/screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF242323),
        title: const Center(child: Text("Iron Calculator")),
      ),
      body: Screen(),
    ));
  } //Build Context

}//My App State