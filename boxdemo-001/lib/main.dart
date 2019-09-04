import 'package:flutter/material.dart';

//void main() {
//  runApp(
//      BoxWidgetLess()
//  );
//}

void main() => runApp(BoxApp());
class BoxApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Box Demo'),
        ),
        body: BoxWidgetLess(),
      ),
      theme: ThemeData(
        primaryColor: Colors.purple
      ),
    );
  }
}



class BoxWidgetLess extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    final _boxTxtStyle = TextStyle(
      color: Colors.blue,
      fontSize: 36.0,
      fontWeight: FontWeight.bold
    );
    return Center(
        child: Text('一个阿狸',
            textDirection: TextDirection.ltr,
            style: _boxTxtStyle
        )
    );
  }
}