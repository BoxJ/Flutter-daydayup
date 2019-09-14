import 'package:boxdemo_006/BoxAnimation.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
        home: BoxOpacityAnimation(title: 'Box Animation Demo'),
//      home: BoxRotationAnimation(title: 'Box Animation Demo'),
//      home: BoxScaleAnimation(title: 'Box Animation Demo'),
//      home: BoxMoveAnimation(title: 'Box Animation Demo'),
    );
  }
}
