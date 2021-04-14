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

  /// Callbacks
  final NextPageCallback onNextPagePressed;
  final PrevPageCallback onPrevPagePressed;
  final ChangePerCallback onPerChangePressed;

  SearchablePaginatedListView(
      {Key key,
      this.pages,
      this.currentPage,
      this.items,
      this.totalItems,
      @required this.header,
      this.perPage,
      @required this.row,
      this.onNextPagePressed,
      this.onPerChangePressed,
      this.onPrevPagePressed})
      : super(key: key);

  @override
  _SearchablePaginatedListViewState createState() =>
      _SearchablePaginatedListViewState();
}

class _SearchablePaginatedListViewState
    extends State<SearchablePaginatedListView> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
          child: Column(
            children: [
              Expanded(
                child: Card(
                  child: ListView.builder(
                      itemCount: widget.items == null ? 1 : widget.items + 1,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        if (index == 0) {
                          return widget.header();
                        }
                        index -= 1;
                        return widget.row(index);
                      }),
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: ListFooterWidget(
                    onNextPagePressed: widget.onNextPagePressed,
                    onPerChangePressed: widget.onPerChangePressed,
                    onPrevPagePressed: widget.onPrevPagePressed,
                    perPage: widget.perPage,
                    totalPages: widget.pages,
                    currentPage: widget.currentPage,
                  ))
            ],
          ),
        ));
  }
}
