import 'package:flutter/material.dart';
import 'package:paginatedlistview/src/utils/Callbacks.dart';

class HeaderCellWidget extends StatelessWidget {
  final bool sortAscending;
  final String label;
  final String headerKey;
  final int index;

  ///Callbacks
  final SearchCallback onSearch;
  final SortCallback onSort;

  final Widget headerWidget;
  const HeaderCellWidget(
      {Key key,
      @required this.label,
      @required this.index,
      @required this.headerKey,
      @required this.headerWidget,
      this.sortAscending,
      this.onSearch,
      this.onSort})
      : super(key: key);

  _createSortIcons(bool sortAscending) {
    if (sortAscending == null) {
      return Container();
    }
    if (sortAscending) {
      return Icon(Icons.arrow_drop_up_outlined);
    } else {
      return Icon(Icons.arrow_drop_down_outlined);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.all(5),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(5),
              child: TextButton(
                onPressed: () {
                  this.onSort(
                      (this.sortAscending == null) ? true : !this.sortAscending,
                      this.index);
                },
                child: Row(children: [
                  Text(this.label,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  _createSortIcons(this.sortAscending)
                ]),
              ),
            ),
            Padding(padding: EdgeInsets.only(bottom: 10), child: headerWidget)
          ],
        ),
      ),
    );
  }
}
