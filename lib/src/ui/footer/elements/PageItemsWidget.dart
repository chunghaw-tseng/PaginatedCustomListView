import 'package:flutter/material.dart';
import 'package:paginatedlistview/src/utils/Callbacks.dart';

class PageItemsWidget extends StatelessWidget {
  final String perPage;
  final ChangePerCallback onPerPagePressed;
  const PageItemsWidget(
      {Key key, @required this.perPage, @required this.onPerPagePressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Text("Show Rows: "),
          DropdownButton(
            value: this.perPage,
            key: Key("PER_PAGE"),
            icon: const Icon(Icons.arrow_downward),
            iconSize: 24,
            elevation: 16,
            style: const TextStyle(color: Colors.deepPurple),
            underline: Container(
              height: 2,
              color: Colors.deepPurpleAccent,
            ),
            onChanged: this.onPerPagePressed,
            items: <String>['10', '20', '30', '40', '50']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                key: Key("$value"),
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
