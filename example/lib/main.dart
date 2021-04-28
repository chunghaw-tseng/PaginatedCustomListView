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

  createExpandedRow(List<String> current) {
    List<Widget> expandedItems = [];
    for (var i = 0; i < current.length; i++) {
      expandedItems.add(ListItem(child: SelectableText("${current[i]}")));
    }
    return expandedItems;
  }

  createHeaders() {
    List<Header> headerList = [];
    for (var header in pageModel.header_data) {
      switch (header["type"]) {
        case HeaderType.selectable:
          headerList.add(Header(
              label: header["name"],
              headerKey: header["key"],
              width: header["width"],
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
              width: header["width"],
              searchField: TimeRangeHeader(
                  textSearch: true,
                  keyName: header["key"],
                  filterSearch: headerFiltered)));
          break;
        case HeaderType.searchable:
        default:
          headerList.add(Header(
              label: header["name"],
              headerKey: header["key"],
              width: header["width"],
              searchField: SearchableHeader(
                  label: header["name"],
                  keyName: header["key"],
                  filterSearch: headerFiltered)));
          break;
      }
    }
    return headerList;
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
                headers: createHeaders(),
                rows: pageModel.large_data
                    .map((e) => RowItems(
                            items: [
                              Text(e["patient_name"]),
                              Text(e["patient_id"]),
                              Text(e["study_iuid"]),
                              Text(e["report_date"]),
                              Text(e["modality"]),
                              TextButton(onPressed: null, child: Text("View")),
                            ],
                            expanded: e.containsKey("series_iuid")
                                ? createExpandedRow(e["series_iuid"])
                                : null))
                    .toList(),
                sortAscending: pageModel.sortAscending,
                sortIndex: pageModel.sortIndex,
                totalpages: pageModel.pageInfo.totalPages,
                currentPage: pageModel.pageInfo.currentPage,
                items: pageModel.pageInfo.items,
                perPage: pageModel.pageInfo.perPage,
                totalItems: pageModel.pageInfo.totalItems,
                onSort: (bool asc, int index) {
                  setState(() {
                    pageModel.updateSort(asc, index);
                  });
                },
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
