import 'package:flutter/material.dart';

class ExpandedListRow extends StatelessWidget {
  final List<Widget> expandedItems;
  const ExpandedListRow({Key key, @required this.expandedItems})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 5, bottom: 5),
      child: Row(
        children: expandedItems,
      ),
    );
  }
}
