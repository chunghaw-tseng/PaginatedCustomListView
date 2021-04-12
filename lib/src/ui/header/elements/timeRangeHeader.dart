import 'package:flutter/material.dart';

class TimeRangeHeader extends StatefulWidget {
  TimeRangeHeader({Key key}) : super(key: key);

  @override
  _TimeRangeHeaderState createState() => _TimeRangeHeaderState();
}

class _TimeRangeHeaderState extends State<TimeRangeHeader> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Range"),
    );
  }
}
