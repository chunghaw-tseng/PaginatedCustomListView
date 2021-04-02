import 'package:flutter/material.dart';

// Data will arrive as
//  current_page
//  number_of_pages
//  items
//
//  items need to be as a list of widgets

// List view with footer
// Header with search

class SearchablePaginatedListView extends StatefulWidget {
  SearchablePaginatedListView(
      {Key key, this.pages, this.currentPage, this.items, this.totalItems})
      : super(key: key);

  final int pages;
  int currentPage;
  final int items;
  final int totalItems;

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
                        return new ListTile(
                          onTap: null,
                          title: Row(
                            children: [
                              Expanded(
                                  child: Column(
                                children: [
                                  Text("First Name"),
                                  TextField(
                                    obscureText: true,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      labelText: 'Search',
                                    ),
                                  )
                                ],
                              ))
                            ],
                          ),
                        );
                      }
                      index -= 1;

                      return ListTile(
                        title: Text('${index}'),
                      );
                    })),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DropdownButton(
                  value: dropdownValue,
                  icon: const Icon(Icons.arrow_downward),
                  iconSize: 24,
                  elevation: 16,
                  style: const TextStyle(color: Colors.deepPurple),
                  underline: Container(
                    height: 2,
                    color: Colors.deepPurpleAccent,
                  ),
                  onChanged: (String newValue) {
                    setState(() {
                      dropdownValue = newValue;
                    });
                  },
                  items: <String>['One', 'Two', 'Free', 'Four']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                Container(
                  child: Row(
                    children: [
                      IconButton(
                          icon: Icon(Icons.arrow_back), onPressed: () => {}),
                      IconButton(
                          icon: Icon(Icons.arrow_forward), onPressed: () => {}),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
