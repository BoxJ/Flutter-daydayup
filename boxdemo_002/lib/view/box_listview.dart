import 'package:boxdemo/model/people.dart';
import 'package:flutter/material.dart';

class BoxListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: boxArr.length,
      itemBuilder: _boxCellForRow,
    );
  }

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
}



