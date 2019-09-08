import 'package:flutter/material.dart';
class BoxRowDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.deepPurple,
      alignment: Alignment(0.0,0.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            color: Colors.red,
            width: 80,
            height: 80,
          ),
          Container(
            color: Colors.green,
            width: 60,
            height: 60,
          ),
          Container(
            color: Colors.blue,
            width: 100,
            height: 100,
          )
        ],
      ),
    );
  }

//  @override
//  Widget build(BuildContext context) {
//    return Container(
//      color: Colors.deepPurple,
//      alignment: Alignment(1.0,0.0),
//      child: Text('一个阿狸',style: _textStyle,),
//    );
//  }
}

class BoxBaseLineDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      children: <Widget>[
        Container(
            child: Text(
              '足记',
              style: TextStyle(fontSize: 15),
            ),
            color: Colors.red,
            height:40,
        ),
        Container(
          child: Text(
            'Fotoplace',
            style: TextStyle(fontSize: 60),
          ),
          color: Colors.purple,
          height: 80,
        ),
        Container(
            child: Text(
              'Box',
              style: TextStyle(fontSize: 30),
            ),
            color: Colors.blue,
            height: 80,
        ),
      ],
    );
  }
}

class BoxExpandedDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      children: <Widget>[
        Expanded(
          child: Container(
            child: Text(
              '足记',
              style: TextStyle(fontSize: 15),
            ),
            color: Colors.red,
            height:40,
          ),
        ),
        Expanded(
          child: Container(
            child: Text(
              'Fotoplace',
              style: TextStyle(fontSize: 60),
            ),
            color: Colors.purple,
//            height: 80,
          ),
        ),
        Expanded(
          child: Container(
            child: Text(
              'Box',
              style: TextStyle(fontSize: 30),
            ),
            color: Colors.blue,
            height: 80,
          ),
        ),
      ],
    );
  }
}

class BoxColumnDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.deepPurple,
      alignment: Alignment(0.0,0.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            color: Colors.red,
            width: 80,
            height: 80,
          ),
          Container(
            color: Colors.green,
            width: 60,
            height: 60,
          ),
          Container(
            color: Colors.blue,
            width: 100,
            height: 100,
          )
        ],
      ),
    );
  }
}
class BoxStackDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          child: Container(
            color: Colors.red,
            width: 200,
            height: 200,
          ),
        ),
        Positioned(
          right: 5,
          bottom: 10,
          child: Container(
            color: Colors.green,
            width: 100,
            height: 100,
          ),
        ),
        Positioned(
          left: 20,
          top: 10,
          child: Container(
            color: Colors.blue,
            width: 50,
            height: 50,
          ),
        ),
      ],
    );
  }
}

class BoxAspectRatioDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.purple,
        alignment: Alignment(0.0,0.0),
        child: Container(
          color: Colors.blue,
          width: 168,
          child: AspectRatio(
            aspectRatio: 1/1,
            child: Icon(Icons.add_circle_outline,),
          ),
        )
    );
  }
}


