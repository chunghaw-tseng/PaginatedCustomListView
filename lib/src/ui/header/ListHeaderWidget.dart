import 'package:flutter/material.dart';
import 'package:paginatedlistview/src/ui/header/elements/headerCellWidget.dart';
import 'package:paginatedlistview/src/utils/Callbacks.dart';
import 'package:paginatedlistview/src/utils/Header.dart';

class ListHeaderWidget extends StatelessWidget {
  final List<Header> headers;
  final bool sortAscending;
  final SortCallback onSort;
  final int sortingIndex;
  const ListHeaderWidget(
      {Key key,
      @required this.headers,
      this.sortAscending,
      this.sortingIndex,
      this.onSort})
      : super(key: key);

  List<HeaderCellWidget> _buildHeadersCells() {
    List<HeaderCellWidget> headerCells = [];
    for (var i = 0; i < headers.length; i++) {
      headerCells.add(HeaderCellWidget(
        label: headers[i].label,
        index: i,
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
    return ListTile(
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
        ));
  }
}
