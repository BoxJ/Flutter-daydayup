import 'package:flutter/material.dart';
import 'model/people.dart';

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
      body: ListView.builder(
        itemCount: boxArr.length,
        itemBuilder: _boxCellForRow,
      ),
    );
  }
// cellForRow方法
//  横向 Row
  Widget _boxCellForRow(BuildContext context, int index) {
    return Container(
      color: Colors.white,
//      height: 88.0,
      margin: EdgeInsets.all(6.0),
      child: Row(
        children: <Widget>[
          Image.network(boxArr[index].avatar,width: 60.0,height: 60.0),
          SizedBox(width: 10),
          Text(boxArr[index].name)
        ],
      ),
    );
  }
////  竖向 Column
//  Widget _boxCellForRow(BuildContext context, int index) {
//    return Container(
//      color: Colors.white,
//      height: 240.0,
//      margin: EdgeInsets.all(6.0),
//      child: Column(
//        children: <Widget>[
//          Image.network(boxArr[index].avatar),
//          Text(boxArr[index].name)
//        ],
//      ),
//    );
//  }
////  垂直 z轴 Stack
//  Widget _boxCellForRow(BuildContext context, int index) {
//    return Container(
//      color: Colors.white,
//      height: 240.0,
//      margin: EdgeInsets.all(6.0),
//      child: Stack(
//        children: <Widget>[
//          Image.network(boxArr[index].avatar),
//          Text(boxArr[index].name)
//        ],
//      ),
//    );
//  }
////  直接一个图片控件
//  Widget _boxCellForRow(BuildContext context, int index) {
//    return Container(
//      color: Colors.white,
//      height: 88.0,
//      margin: EdgeInsets.all(6.0),
//      child: Image.network(boxArr[index].avatar),
//    );
//  }
//  Widget _boxCellForRow(BuildContext context, int index) {
//    return Text('阿狸', textDirection: TextDirection.ltr);
//  }
}


//class BoxApp extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      home: Scaffold(
//        appBar: AppBar(
//          title: Text('Box Demo'),
//        ),
//        body: BoxWidgetLess(),
//      ),
//      theme: ThemeData(
//        primaryColor: Colors.purple
//      ),
//    );
//  }
//}

//class BoxWidgetLess extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    // TODO: implement build
//
//    final _boxTxtStyle = TextStyle(
//      color: Colors.blue,
//      fontSize: 36.0,
//      fontWeight: FontWeight.bold
//    );
//    return Center(
//        child: Text('一个阿狸',
//            textDirection: TextDirection.ltr,
//            style: _boxTxtStyle
//        )
//    );
//  }
//}