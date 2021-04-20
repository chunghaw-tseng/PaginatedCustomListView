import 'package:flutter/material.dart';

class ListItem extends StatelessWidget {
  final Widget child;

  const ListItem({Key key, @required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(child: Center(child: child));
  }
}
