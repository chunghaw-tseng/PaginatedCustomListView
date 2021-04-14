import 'package:flutter/material.dart';

class ListItem extends StatelessWidget {
  final Widget child;
  final String searchKey;

  const ListItem({Key key, @required this.child, @required this.searchKey})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(child: Center(child: child));
  }
}
