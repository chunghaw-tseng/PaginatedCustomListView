import 'package:flutter/material.dart';
import 'package:paginatedlistview/src/ui/listrow/elements/ListItem.dart';

// Add the series to the list
class ListRowWidget extends StatelessWidget {
  final List<Widget> cells;
  final bool expandable;
  final List<ListItem> expandedCells;
  const ListRowWidget(
      {Key key,
      @required this.cells,
      @required this.expandable,
      this.expandedCells})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return expandable
        ? ExpansionTile(
            title: Row(
              children: cells,
            ),
            children: [],
          )
        : ListTile(
            onTap: () {},
            title: Row(
              children: cells,
            ),
          );
  }
}
