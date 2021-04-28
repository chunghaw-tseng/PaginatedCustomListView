import 'package:flutter/material.dart';
import 'package:paginatedlistview/src/ui/header/elements/elements.dart';
import 'package:paginatedlistview/src/utils/callbacks.dart';
import 'package:paginatedlistview/src/utils/header.dart';

class ListHeaderWidget extends StatelessWidget {
  final List<Header> headers;
  final bool sortAscending;
  final SortCallback onSort;
  final int sortingIndex;
  final double headerWidth;
  const ListHeaderWidget(
      {Key key,
      @required this.headers,
      this.sortAscending,
      this.sortingIndex,
      this.headerWidth,
      this.onSort})
      : super(key: key);

  List<HeaderCellWidget> _buildHeadersCells() {
    List<HeaderCellWidget> headerCells = [];
    for (var i = 0; i < headers.length; i++) {
      headerCells.add(HeaderCellWidget(
        label: headers[i].label,
        index: i,
        width: headers[i].width,
        sortAscending: (i != sortingIndex) ? null : sortAscending,
        headerKey: headers[i].headerKey,
        headerWidget: headers[i].searchField,
        onSort: this.onSort,
      ));
    }
    return headerCells;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: this.headerWidth,
        child: ListTile(
          onTap: null,
          title: Container(
            decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.black))),
            child: Padding(
              padding: EdgeInsets.only(right: 35),
              child: Row(
                children: _buildHeadersCells(),
              ),
            ),
          ),
        ));
  }
}
