import 'package:flutter/material.dart';

class PageItemsWidgets extends StatefulWidget {
  PageItemsWidgets({Key key}) : super(key: key);

  @override
  _PageItemsWidgetsState createState() => _PageItemsWidgetsState();
}

class _PageItemsWidgetsState extends State<PageItemsWidgets> {
  String dropdownValue = '10';

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Text("Show Rows : "),
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
