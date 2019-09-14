
import 'package:flutter/material.dart';

class BoxMoveAnimation extends StatefulWidget {
  BoxMoveAnimation({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _BoxMoveAnimationState createState() => _BoxMoveAnimationState();
}

class _BoxMoveAnimationState extends State<BoxMoveAnimation> with TickerProviderStateMixin {

  AnimationController controller;
  Animation<Offset> animation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Container(
        //SlideTransition 用于执行平移动画
        child: SlideTransition(
          position: animation,
          //将要执行动画的子view
          child: Container(
            width: 200,
            height: 200,
            color: Colors.red,
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller =
        AnimationController(duration: Duration(milliseconds: 2000), vsync: this);
    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        debugPrint('完成');
        controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        debugPrint('消失');
        controller.forward();
//        controller.dispose();
      }
    });
    animation =
        Tween(begin: Offset.zero, end: Offset(1.0, 0.0)).animate(controller);
    //开始执行动画
    controller.forward();
  }
}


class BoxScaleAnimation extends StatefulWidget {
  BoxScaleAnimation({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _BoxScaleAnimationState createState() => _BoxScaleAnimationState();
}

class _BoxScaleAnimationState extends State<BoxScaleAnimation> with TickerProviderStateMixin {

  AnimationController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);
    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        print("completed");
        controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        print("dismissed");
        controller.forward();
      } else if (status == AnimationStatus.forward) {
        print("forward");
      } else if (status == AnimationStatus.reverse) {
        print("reverse");
      }
    });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(title: Text(widget.title)),
        body:Center(
          child: ScaleTransition(
            alignment: Alignment.center,
            scale: controller,
            child: Container(
              width: 200,
              height: 200,
              color: Colors.blue,
            ),
          ),
        ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }
}


class BoxRotationAnimation extends StatefulWidget {
  BoxRotationAnimation({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _BoxRotationAnimationState createState() => _BoxRotationAnimationState();
}

class _BoxRotationAnimationState extends State<BoxRotationAnimation> with TickerProviderStateMixin {

  AnimationController controller;
  Animation animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 3), vsync: this);
    animation =
        Tween(begin: 0.0, end: 0.25).animate(controller);
    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        print("completed");
        controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        print("dismissed");
        controller.forward();
      } else if (status == AnimationStatus.forward) {
        print("forward");
      } else if (status == AnimationStatus.reverse) {
        print("reverse");
      }
    });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body:Center(
        child: RotationTransition(
          alignment: Alignment.center,
          turns: animation,
          child: Container(
            width: 160,
            height: 160,
            color: Colors.green,
            child: Center(
              child: Text('Box'),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }
}

class BoxOpacityAnimation extends StatefulWidget {
  BoxOpacityAnimation({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _BoxOpacityAnimationState createState() => _BoxOpacityAnimationState();
}

class _BoxOpacityAnimationState extends State<BoxOpacityAnimation> with TickerProviderStateMixin {

  AnimationController controller;
  Animation animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);
    animation =
        Tween(begin: 0.0, end: 1.0).animate(controller);
    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        print("completed");
        controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        print("dismissed");
        controller.forward();
      } else if (status == AnimationStatus.forward) {
        print("forward");
      } else if (status == AnimationStatus.reverse) {
        print("reverse");
      }
    });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body:Center(
        child: FadeTransition(
          opacity: animation,
          child: Container(
            width: 160,
            height: 160,
            color: Colors.green,
            child: Center(
              child: Text('Box'),
            ),
          ),
        ),

      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }
}
