import 'dart:io';

import 'package:flutter/material.dart';
import 'package:paginatedlistview/src/ui/footer/ListFooterWidget.dart';
import 'package:paginatedlistview/src/ui/header/ListHeaderWidget.dart';
import 'package:paginatedlistview/src/ui/listrow/ListRowWidget.dart';
import 'package:paginatedlistview/src/ui/header/elements/headerWidget.dart';

import '../listrow/elements/ListText.dart';

// Data will arrive as
//  current_page
//  number_of_pages
//  items
//
//  items need to be as a list of widgets

// List view with footer
// Header with search

class SearchablePaginatedListView extends StatefulWidget {
  final int pages;
  final int currentPage;
  final ListHeaderWidget header;
  final ListRowWidget row;

  /// Data send
  final Map<String, dynamic> data;
  final int items;
  final int totalItems;
  SearchablePaginatedListView(
      {Key key,
      this.pages,
      this.currentPage,
      this.items,
      this.totalItems,
      this.header,
      this.data,
      this.row})
      : super(key: key);

  @override
  _SearchablePaginatedListViewState createState() =>
      _SearchablePaginatedListViewState();
}

class _SearchablePaginatedListViewState
    extends State<SearchablePaginatedListView> {
  String dropdownValue = 'One';

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
                        // return the header
                        return ListHeaderWidget(headers: [
                          HeaderWidget(
                              title: "Search",
                              label: "Searchable",
                              type: HeaderType.searchable),
                          HeaderWidget(
                              title: "Select",
                              label: "Selectable",
                              selection: ["Select A", "Select B", "Select C"],
                              type: HeaderType.selectable),
                          HeaderWidget(
                              title: "Search B",
                              label: "Searchable B",
                              type: HeaderType.searchable),
                        ]);
                      }
                      index -= 1;
                      return ListRowWidget(cells: [
                        ListText(text: "$index"),
                        ListText(text: "$index"),
                        ListText(text: "$index")
                      ]);
                    })),
          ),
          Padding(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: ListFooterWidget(
                onNextPagePressed: (value) {
                  print("Next Page pressed $value");
                },
                onPerChangePressed: (value) {
                  print("Per Page pressed $value");
                },
                onPrevPagePressed: (value) {
                  print("Prev page pressed $value");
                },
                perPage: "10",
                totalPages: 10,
                currentPage: 2,
              ))
        ],
      ),
    );
  }
}
