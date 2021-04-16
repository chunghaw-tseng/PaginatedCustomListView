import 'package:flutter/material.dart';
import 'package:paginatedlistview/src/ui/footer/ListFooterWidget.dart';
import 'package:paginatedlistview/src/utils/Callbacks.dart';

class SearchablePaginatedListView extends StatefulWidget {
  final int pages;
  final int currentPage;
  final String perPage;
  final CreateHeader header;
  final CreateRow row;
  final int items;
  final int totalItems;
  // final int sortIndex;
  // final bool sortAscending;

  /// Callbacks
  final PageChangeCallback onPageChange;
  final ChangePerCallback onPerChangePressed;

  SearchablePaginatedListView({
    Key key,
    this.pages,
    this.currentPage,
    this.items,
    this.totalItems,
    @required this.header,
    this.perPage,
    @required this.row,
    this.onPageChange,
    this.onPerChangePressed,
  }) : super(key: key);

  @override
  _SearchablePaginatedListViewState createState() =>
      _SearchablePaginatedListViewState();
}

// TODO Add the header as a listTile on top of the listbuilder
class _SearchablePaginatedListViewState
    extends State<SearchablePaginatedListView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Expanded(
            child: Card(
              child: Column(children: [
                ListView.builder(
                    itemCount: widget.items == null ? 1 : widget.items + 1,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      if (index == 0) {
                        return widget.header();
                      }
                      index -= 1;
                      return widget.row(index);
                    }),
              ]),
            ),
          ),
          Padding(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: ListFooterWidget(
                onPerChangePressed: widget.onPerChangePressed,
                onPageChanged: widget.onPageChange,
                perPage: widget.perPage,
                totalPages: widget.pages,
                currentPage: widget.currentPage,
              ))
        ],
      ),
    );
  }
}
