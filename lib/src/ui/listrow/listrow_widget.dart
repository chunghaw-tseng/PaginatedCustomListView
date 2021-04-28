import 'package:flutter/material.dart';
import 'package:paginatedlistview/src/ui/listrow/elements/expandedlist_row.dart';

// Add the series to the list
class ListRowWidget extends StatelessWidget {
  final List<Widget> cells;
  final List<Widget> expandedCells;
  const ListRowWidget({Key key, @required this.cells, this.expandedCells})
      : super(key: key);

  List<ExpandedListRow> _createRows() {
    List<ExpandedListRow> rows = [];
    for (var i = 0; i < expandedCells.length; i++) {
      rows.add(ExpandedListRow(
        expandedItems: [expandedCells[i]],
      ));
    }
    return rows;
  }

  @override
  Widget build(BuildContext context) {
    return expandedCells != null
        ? ExpansionTile(
            title: Row(
              children: cells,
            ),
            children: [
                Column(
                  children: _createRows(),
                ),
              ])
        : ListTile(
            onTap: () {},
            trailing: Container(width: 32),
            title: Row(
              children: cells,
            ),
          );
  }
}
