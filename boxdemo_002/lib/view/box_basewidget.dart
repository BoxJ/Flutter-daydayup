import 'package:flutter/material.dart';

class BoxText extends StatelessWidget {
  final TextStyle _textStyle = TextStyle(
    fontSize: 18.0,
    letterSpacing: 20,
    color: Colors.red
  );

  final String _title = '足记';
  final String _lector = 'Box';

  @override
  Widget build(BuildContext context) {
    return Text(
      '《 $_title 》 -$_lector \n   足记，一款精心打造的原创图片、短视频社交媒体，在足记可以制作壁纸，视频编辑以及各种长短图片视频制作。足记让用户拥有全新的赋能，足不出户记录旅行、生活、工作等多方位的场景，通过长短图片、长短视频、以及各种攻略，让足记4000多万的用户更多的关注到你。这个世界，因为你们的镜头、你们的语言、你们的脑洞变得更有趣。',
      textAlign: TextAlign.center,
      style: _textStyle,
      maxLines: 4,
      overflow: TextOverflow.ellipsis,
    );
  }
}

class BoxRichText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: '《 Flutter 》\n',
        style: TextStyle(fontSize: 30, color: Colors.black),
        children: <TextSpan>[
          TextSpan(
            text: '足记',
            style: TextStyle(fontSize: 16, color: Colors.blue),
          ),
          TextSpan(
            text: '-Fotoplace-',
            style: TextStyle(fontSize: 36, color: Colors.purple),
          ),
          TextSpan(
            text: 'Box',
            style: TextStyle(fontSize: 18, color: Colors.red),
          ),
        ],
      ),
    );
  }
}

class BoxRichTextR extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
          children: [
            TextSpan(
              text: "《 Flutter 》\n",
              style: TextStyle(
                color:Colors.purple,
                fontSize: 25.0,
              ),
            ),
            TextSpan(
              text: "-Fotoplace-",
              style: TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.w500,
                fontSize: 18.0,
              ),
            ),
            TextSpan(
                text: "Box",
                style: TextStyle(
                  color: Colors.lime,
                  decoration: TextDecoration.underline,
                  fontSize: 30.0,
                ),
            ),
          ]
      ),
    );
  }
}



class BoxBaseWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow,
      child: Row(
        children: <Widget>[
          Container(
            width: 100,
            height: 100,
            padding: EdgeInsets.only(left: 30,right: 10,top: 10,bottom: 10),
            color: Colors.red,
            child: Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
