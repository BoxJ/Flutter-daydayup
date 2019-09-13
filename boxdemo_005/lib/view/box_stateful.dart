//import 'dart:async';
import 'package:boxdemo/network/BoxDioTool.dart';
import 'package:boxdemo/network/BoxDioTool.dart' as prefix0;
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

class _ChildLessWidget extends StatelessWidget {  //stateless
  final bool active;
  final ValueChanged<bool> onChanged;
  _ChildLessWidget({Key key, this.active: false, @required this.onChanged})
      : super(key: key);
  void _handleTap() {
    _boxDioGet();
//    _httpGet();
//      _dioHttpGet();
  }

  _boxDioGet() {
     BoxDioTool.request('satinGodApi',parameters:{'a':'2'},
      onSuccess: (data) {
      print('成功回调'+data.toString());
    },
      onError: (error) {
        print('出错回调'+error);
      },);
  }

  _dioHttpGet() async {
    Dio dio = new Dio(); // with default Options
// Set default configs
    dio.options.baseUrl = "https://www.apiopen.top";
    dio.options.connectTimeout = 5000; //5s
    dio.options.receiveTimeout = 3000;
    Response response= await dio.get("/satinGodApi");
    print(response.data.toString());
  }

  _httpGet()
  async {
    var url = 'https://www.apiopen.top/satinGodApi';
//    var response = await http.post(url, body: {'name': 'doodle', 'color': 'blue'});
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: Container(
        alignment: Alignment(0, 0),
        child: Text(
          '点击进行网络请求',
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
        title: Text('网络请求'),
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

