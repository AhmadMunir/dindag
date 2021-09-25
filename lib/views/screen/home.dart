import 'bae/event.dart';

import 'menu/tambah_laporan.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static String id = 'HomeScreen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List colors = [
    Colors.amber[200],
    Colors.blue[300],
    Colors.pink[200],
    Colors.indigo[300],
    Colors.deepOrange[200],
    Colors.teal[200],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[900],
      // body:
    );
  }
}
