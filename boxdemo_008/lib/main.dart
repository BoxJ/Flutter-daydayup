import 'package:cached_network_image/cached_network_image.dart';
import 'package:device_info/device_info.dart';
import 'package:flutter/material.dart';
import 'package:package_info/package_info.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:transparent_image/transparent_image.dart';
import 'dart:io';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Box Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body:BoxShow(),
    );
  }
}
class BoxShow extends StatefulWidget {
  @override
  _BoxShowState createState() => _BoxShowState();
}

class _BoxShowState extends State<BoxShow> {
  save() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('userName', '阿狸');
  }

  Future<String> get() async {
    var userName;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userName = prefs.getString('userName');
    return userName;
  }

  void _getDeviceInfo() async{
    DeviceInfoPlugin deviceInfo = new DeviceInfoPlugin();
    if(Platform.isIOS){
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      debugPrint('IOS设备>' + iosInfo.systemName + '>' + iosInfo.systemVersion + '>' + iosInfo.model);
    }else if(Platform.isAndroid){
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      debugPrint('Android设备>' + androidInfo.bootloader + androidInfo.model);
    }
  }

  void _getAppInfo() async{
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String appName = packageInfo.appName;
    String packageName = packageInfo.packageName;
    String appVersion = packageInfo.version;
    String appBuildNumber = packageInfo.buildNumber;
    debugPrint('APP>' + appVersion + '>' + appBuildNumber);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      // Center is a layout widget. It takes a single child and positions it
      // in the middle of the parent.
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image(image: AssetImage('images/box001.png')),
          Text(
            '本地图片',
            style: Theme.of(context).textTheme.display1,
          ),
          SizedBox(height: 30,),
          Container(
            height: 100.0,
            alignment: Alignment(0, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.network('http://cache.fotoplace.cc/ap2/190521/0/6478737E09CA39170389191133953111.png'),
                FadeInImage.memoryNetwork(
                  placeholder: kTransparentImage,
                  image: 'http://cache.fotoplace.cc/ap2/190521/0/6478737E09CA39170389191133953111.png',
                ),
                CachedNetworkImage(
                  imageUrl: "http://cache.fotoplace.cc/ap2/190521/0/6478737E09CA39170389191133953111.png",
                  placeholder: (context, url) => CircularProgressIndicator(),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ],
            ),
          ),
          Text(
            '网络图片',
            style: Theme.of(context).textTheme.display1,
          ),
          RaisedButton(
              color: Colors.blueAccent,
              child: Text("存储"),
              onPressed: () {
                save();
                Scaffold.of(context).showSnackBar(
                    new SnackBar(duration: Duration(milliseconds: 600), content:  Text("数据存储成功")));
              }),
          RaisedButton(
              color: Colors.blueAccent,
              child: Text("读取"),
              onPressed: () {
                Future<String> userName = get();
                userName.then((String userName) {
                  Scaffold.of(context).showSnackBar(
                      SnackBar(duration: Duration(milliseconds: 600), content: Text("数据获取成功：$userName")));
                });
              }),
          RaisedButton(
              color: Colors.blueAccent,
              child: Text("获取设备信息"),
              onPressed: () {
                _getDeviceInfo();
              }),
          RaisedButton(
              color: Colors.blueAccent,
              child: Text("获取APP信息"),
              onPressed: () {
                _getAppInfo();
              }),
        ],
      ),
    );
  }
}

