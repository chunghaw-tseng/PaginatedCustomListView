import 'package:flutter/material.dart';
import 'package:paginatedlistview/src/utils/Callbacks.dart';

class PageItemsWidgets extends StatefulWidget {
  final String perPage;
  final ChangePerCallback onPerPagePressed;
  PageItemsWidgets(
      {Key key, @required this.perPage, @required this.onPerPagePressed})
      : super(key: key);

  @override
  _PageItemsWidgetsState createState() => _PageItemsWidgetsState();
}

class _PageItemsWidgetsState extends State<PageItemsWidgets> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Text("Show Rows : "),
          DropdownButton(
            value: widget.perPage,
            icon: const Icon(Icons.arrow_downward),
            iconSize: 24,
            elevation: 16,
            style: const TextStyle(color: Colors.deepPurple),
            underline: Container(
              height: 2,
              color: Colors.deepPurpleAccent,
            ),
            onChanged: (String newValue) {
              widget.onPerPagePressed(newValue);
            },
            items: <String>['10', '20', '30', '40', '50']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          )
        ],
      ),
    );
  }
}
