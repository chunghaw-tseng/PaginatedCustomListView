import 'package:flutter/material.dart';

class ListIcon extends StatelessWidget {
  final Icon icon;
  const ListIcon({Key key, @required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: icon,
      ),
    );
  }
}
