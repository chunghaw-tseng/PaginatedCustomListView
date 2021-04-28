import 'package:flutter/material.dart';

class ListItem extends StatelessWidget {
  final Widget child;
  final double width;

  const ListItem({Key key, @required this.child, this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return this.width != null
        ? ConstrainedBox(
            constraints: BoxConstraints(
                minWidth: 50.0,
                maxWidth: this.width != null ? this.width : 275.0,
                minHeight: 60),
            child: Center(child: child))
        : Expanded(child: Center(child: child));
  }
}
