import 'package:boxdemo/view/box_stateful.dart';
import 'package:flutter/material.dart';

void main() => runApp(BoxApp());
class BoxApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, //隐藏右上角DEBUG标识
      home: BoxParentWidget(), //替换此处可以改变Demo运行  BoxCounterDemo
      theme: ThemeData(
          primaryColor: Colors.blue
      ),
    );
  }
}