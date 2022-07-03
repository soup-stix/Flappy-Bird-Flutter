

import 'package:flutter/material.dart';
import 'package:frappy_bird/homepage.dart';
import 'package:frappy_bird/barrier.dart';
//import 'package:network_info_plus/network_info_plus.dart';
import 'package:network_info_plus/network_info_plus.dart';
void main() {

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}



