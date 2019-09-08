import 'package:flutter/material.dart';

class _ChildLessWidget extends StatelessWidget {  //stateless
  final bool active;
  final ValueChanged<bool> onChanged;
  _ChildLessWidget({Key key, this.active: false, @required this.onChanged})
      : super(key: key);
  void _handleTap() {
    onChanged(!active);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: Container(
        alignment: Alignment(0, 0),
        child: Text(
          '点击更改背景色',
          style: new TextStyle(fontSize: 44.0, color: Colors.white),
        ),
        color: active ? Colors.red : Colors.blue,
      ),
    );
  }
}
class BoxParentWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _BoxParentWidgetState();
  }
}

class _BoxParentWidgetState extends State<BoxParentWidget> {
  var _active = false;
  _handleDidTap(bool newValue) {
    setState(() {
      _active = newValue;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BoxStateFulDemo'),
      ),
      body: _ChildLessWidget(
        active: _active,
        onChanged: _handleDidTap,
      ),
    );
  }
}

class BoxCounterDemo extends StatefulWidget {
  @override
//  _BoxCounterDemoState createState() => _BoxCounterDemoState();
  State<StatefulWidget> createState() {
    return _BoxCounterDemoState();
  }
}

class _BoxCounterDemoState extends State<BoxCounterDemo> {
  int countNumber = 0;
  TextStyle _style = TextStyle(
      color: Colors.red,
      fontSize: 56
  );
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('BoxStateFulDemo'),
      ),
      body: Center(
        child: Text('$countNumber',style: _style,),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          countNumber += 1;
          setState(() {});//重新刷新！ 这一句非常重要
          print('count = $countNumber');
        },
      ),
    );
  }
}

