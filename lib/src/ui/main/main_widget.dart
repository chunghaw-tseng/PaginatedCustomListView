import 'package:flutter/material.dart';
import 'package:paginatedlistview/src/ui/footer/listfooter_widget.dart';
import 'package:paginatedlistview/src/ui/header/list_header.dart';
import 'package:paginatedlistview/src/ui/listrow/elements/listitem.dart';
import 'package:paginatedlistview/src/ui/listrow/listrow_widget.dart';
import 'package:paginatedlistview/src/utils/callbacks.dart';
import 'package:paginatedlistview/src/utils/header.dart';
import 'package:paginatedlistview/src/utils/utils.dart';

class SearchablePaginatedListView extends StatefulWidget {
  final int totalpages;
  final int currentPage;
  final String perPage;
  final List<Header> headers;
  final int sortIndex;
  final bool sortAscending;
  final List<RowItems> rows;
  final int items;
  final int totalItems;
  final Color bgcolor;
  final Widget noDataMsg;

  /// Callbacks
  final PageChangeCallback onPageChange;
  final ChangePerCallback onPerChangePressed;
  final SortCallback onSort;

  SearchablePaginatedListView({
    Key key,
    @required this.totalpages,
    @required this.currentPage,
    @required this.items,
    @required this.totalItems,
    @required this.headers,
    @required this.sortIndex,
    @required this.sortAscending,
    @required this.perPage,
    @required this.rows,
    this.noDataMsg,
    this.bgcolor,
    this.onPageChange,
    this.onSort,
    this.onPerChangePressed,
  })  : assert(sortIndex >= 0, "Sort Index cannot be negative"),
        assert(sortIndex <= headers.length - 1,
            "Sort index cannot be larger than header length"),
        assert(currentPage <= totalpages,
            "Current page cannot be larger than total pages"),
        super(key: key);

  @override
  _SearchablePaginatedListViewState createState() =>
      _SearchablePaginatedListViewState();
}

class _SearchablePaginatedListViewState
    extends State<SearchablePaginatedListView> {
  double _listWidth;
  double _expandedTileWidth = 75;

  @override
  void initState() {
    super.initState();
    _listWidth = _getHeadersWidth();
  }

  _getHeadersWidth() {
    double width = 0;
    for (Header i in widget.headers) {
      if (i.width == null) {
        width += 265.0;
      } else {
        width += i.width;
      }
    }
    return width + _expandedTileWidth;
  }

  List<ListRowWidget> _createRows() {
    List<ListRowWidget> listData = [];
    for (RowItems row in widget.rows) {
      List<ListItem> items = [];
      for (var i = 0; i < row.items.length; i++) {
        items
            .add(ListItem(child: row.items[i], width: widget.headers[i].width));
      }
      listData.add(ListRowWidget(
        cells: items,
        expandedCells: row.expanded,
      ));
    }
    return listData;
  }

  // Pass the size to the items
  _createListData() {
    if (widget.rows.length == 0) {
      return widget.noDataMsg == null
          ? Center(child: Text("No data"))
          : widget.noDataMsg;
    } else {
      assert(widget.headers.length == widget.rows[0].items.length,
          "Header length not equal the Row length");
      // Create the ListRow
      return ListView(shrinkWrap: true, children: _createRows());
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Card(
                color: widget.bgcolor,
                // Separating header and rows for fixed header
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ListHeaderWidget(
                          headerWidth: _listWidth,
                          headers: widget.headers,
                          sortAscending: widget.sortAscending,
                          sortingIndex: widget.sortIndex,
                          onSort: widget.onSort),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Container(
                            width: _listWidth,
                            child: _createListData(),
                          ),
                        ),
                      ),
                    ]),
              ),
            ),
          ),
          Padding(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: ListFooterWidget(
                onPerChangePressed: widget.onPerChangePressed,
                onPageChanged: widget.onPageChange,
                perPage: widget.perPage,
                totalPages: widget.totalpages,
                currentPage: widget.currentPage,
              ))
        ],
      ),
    );
  }
}
