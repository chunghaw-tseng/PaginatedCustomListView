import 'dart:html';

import 'package:flutter/material.dart';
import 'package:paginatedlistview/paginatedlistview.dart';
import 'package:scoped_model/scoped_model.dart';
import 'model/pagingListViewModel.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Paginated Listview Demo'),
    );
  }
}

// Create more customizable items
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  PagingListViewModel pageModel;

  @override
  void initState() {
    super.initState();
    pageModel = PagingListViewModel();
  }

  headerFiltered(String searchkey, dynamic data) {
    pageModel.addQuery(searchkey, data);
  }

  sortData(bool sortKey, dynamic data) {
    pageModel.updateSort(sortKey, data);
  }

  createExpandedRow(List<String> current) {
    List<Widget> expandedItems = [];
    for (var i = 0; i < current.length; i++) {
      expandedItems.add(ListItem(
          child: SelectableText("${current[i]}"), searchKey: "${current[i]}"));
    }
    return expandedItems;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: ScopedModel(
              model: pageModel,
              child: SearchablePaginatedListView(
                header: () {
                  List<Header> headerList = [];
                  for (var header in pageModel.header_data) {
                    switch (header["type"]) {
                      case HeaderType.selectable:
                        headerList.add(Header(
                            label: header["name"],
                            headerKey: header["key"],
                            searchField: SelectableHeader(
                                label: header["name"],
                                selection: header["selection"],
                                keyName: header["key"],
                                filterSearch: headerFiltered)));
                        break;
                      case HeaderType.date:
                        headerList.add(Header(
                            label: header["name"],
                            headerKey: header["key"],
                            searchField: TimeRangeHeader(
                                label: header["name"],
                                textSearch: true,
                                keyName: header["key"],
                                filterSearch: headerFiltered)));
                        break;
                      case HeaderType.searchable:
                      default:
                        headerList.add(Header(
                            label: header["name"],
                            headerKey: header["key"],
                            searchField: SearchableHeader(
                                label: header["name"],
                                keyName: header["key"],
                                filterSearch: headerFiltered)));
                        break;
                    }
                  }
                  return ListHeaderWidget(
                    headers: headerList,
                    sortAscending: pageModel.sortAscending,
                    sortingIndex: pageModel.sortIndex,
                    onSort: (bool asc, int index) {
                      setState(() {
                        pageModel.updateSort(asc, index);
                      });
                    },
                  );
                },
                row: (int index) {
                  var current = pageModel.data[index];
                  return ListRowWidget(
                      cells: [
                        ListItem(
                          child: Text(current["patient_name"]),
                          searchKey: current["patient_name"],
                        ),
                        ListItem(
                          child: Text(current["patient_id"]),
                          searchKey: current["patient_id"],
                        ),
                        ListItem(
                          child: Text(current["study_iuid"]),
                          searchKey: current["study_iuid"],
                        ),
                        ListItem(
                          child: Text(current["report_date"]),
                          searchKey: current["report_date"],
                        ),
                        ListItem(
                          child: Text(current["modality"]),
                          searchKey: current["modality"],
                        ),
                        ListItem(
                          child: TextButton(
                            onPressed: null,
                            child: Text("View"),
                          ),
                          searchKey: current["modality"],
                        ),
                      ],
                      expandedCells: current.containsKey("series_iuid")
                          ? createExpandedRow(current["series_iuid"])
                          : null);
                },
                pages: pageModel.pageInfo.totalPages,
                currentPage: pageModel.pageInfo.currentPage,
                items: pageModel.pageInfo.items,
                perPage: pageModel.pageInfo.perPage,
                totalItems: pageModel.pageInfo.totalItems,
                onPageChange: (value) {
                  setState(() {
                    pageModel.changePage(value);
                  });
                },
                onPerChangePressed: (value) {
                  setState(() {
                    pageModel.changePerPage(value);
                  });
                },
              )),
        ));
  }
}
