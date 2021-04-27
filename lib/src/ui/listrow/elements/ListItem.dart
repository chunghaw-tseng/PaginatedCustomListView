import 'package:flutter/material.dart';

class ListItem extends StatelessWidget {
  final Widget child;

  const ListItem({Key key, @required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ConstrainedBox(
            constraints:
                BoxConstraints(minWidth: 200, maxWidth: 400, minHeight: 60),
            child: Center(child: child)));
  }
}
