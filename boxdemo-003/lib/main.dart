import 'package:flutter/material.dart';
import 'view/box_layout.dart';

void main() => runApp(BoxApp());
class BoxApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, //隐藏右上角DEBUG标识
      home: BoxHome(),
      theme: ThemeData(
          primaryColor: Colors.blue
      ),
    );
  }
}
class BoxHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Box Demo'),
      ),
      body: BoxAspectRatioDemo(), //想看其他效果 直接改这行代码就可以
    );
  }
}