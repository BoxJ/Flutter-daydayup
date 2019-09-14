import 'dart:math';
import 'package:flutter/material.dart';


class BoxPanView extends StatefulWidget {
  @override
  _BoxPanViewState createState() => _BoxPanViewState();
}

class _BoxPanViewState extends State<BoxPanView> with TickerProviderStateMixin {

  double _offsetX = 0.0;
  double _tmpX = 0.0;
  double _offsetY = 0.0;
  double _tmpY = 0.0;

  Offset _tmpOffset = Offset.zero;

  AnimationController _animationController;
  Animation<double> _values;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    _values = Tween(begin: 1.0, end: 0.0).animate(_animationController);
    _animationController.addListener(() {
      setState(() {
        _offsetX = _tmpX * _values.value;
        _offsetY = _tmpY * _values.value;
      });
    });
  }

  @override
  void dispose() {
    _animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onDoubleTap: () {
          if (!_animationController.isAnimating) {
            _tmpX = _offsetX;
            _tmpY = _offsetY;
            _animationController.reset();
            _animationController.forward();
          }
        },
        onPanStart: (details) {
          if (!_animationController.isAnimating) {
            _tmpOffset = details.globalPosition;
            _tmpX = _offsetX;
            _tmpY = _offsetY;
          }
        },
        onPanUpdate: (details) {
          if (!_animationController.isAnimating) {
            setState(() {
              _offsetX = _tmpX + (details.globalPosition.dx - _tmpOffset.dx);
              _offsetY = _tmpY + (details.globalPosition.dy - _tmpOffset.dy);
            });
          }
        },
        child: Container(
          color: Colors.white,
          child: Center(
            child: Transform.translate(
              offset: Offset(_offsetX, _offsetY),
              child: Container(
                width: 100,
                height: 100,
                color: Colors.red,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class BoxDownRotationView extends StatefulWidget {
  @override
  _BoxDownRotationViewState createState() => _BoxDownRotationViewState();
}

class _BoxDownRotationViewState extends State<BoxDownRotationView> with TickerProviderStateMixin{
  double _offsetX = 0.0;
  double _tmpX = 0.0;

  double _tmpY = 0.0;

  Offset _tmpOffset = Offset.zero;

  AnimationController _animationController;
  Animation<double> _values;


  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    _values = Tween(begin: 1.0, end: 0.0).animate(_animationController);
    _animationController.addListener(() {
      setState(() {
        _offsetX = _tmpX * _values.value;
      });
    });
  }

  @override
  void dispose() {
    _animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onDoubleTap: () {
          if (!_animationController.isAnimating) {
            _tmpX = _offsetX;
            _animationController.reset();
            _animationController.forward();
          }
        },
        onHorizontalDragStart: (details) {
          if (!_animationController.isAnimating) {
            _tmpOffset = details.globalPosition;
            _tmpX = _offsetX;
            _tmpY=_tmpOffset.dy;
            debugPrint('offsetY:$_tmpY');
          }
        },
        onHorizontalDragUpdate: (details) {
          if (!_animationController.isAnimating) {
            setState(() {
              _offsetX = _tmpX + (details.globalPosition.dx - _tmpOffset.dx);
              debugPrint('offsetX:$_offsetX');
            });
          }
        },
        onHorizontalDragEnd: (details) {
          if (!_animationController.isAnimating) {
            _tmpX = _offsetX;
            _animationController.reset();
            _animationController.forward();
          }
        },
        child: Container(
          color: Colors.white,
          child: Center(
            child: Transform.rotate(
              angle: _offsetX>0 ? acos((560.0-_tmpY)/sqrt((560.0-_tmpY)*(560.0-_tmpY)+_offsetX*_offsetX)) : -acos((560.0-_tmpY)/sqrt((560.0-_tmpY)*(560.0-_tmpY)+_offsetX*_offsetX)),
              origin: Offset(0, 560),
              child: Container(
                width: 300,
                height: 560,
                decoration: BoxDecoration(
                  color: Colors.green,
                  border: Border.all(color: Colors.green, width: 1),
                  borderRadius: BorderRadius.all(//圆角
                      Radius.circular(20.0)
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

