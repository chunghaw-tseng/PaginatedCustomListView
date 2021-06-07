import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:paginatedlistview/src/utils/callbacks.dart';

class SearchableHeader extends StatefulWidget {
  /// Label
  final String label;
  final String keyName;
  final SearchCallback filterSearch;

  SearchableHeader(
      {Key key,
      @required this.label,
      @required this.filterSearch,
      @required this.keyName})
      : super(key: key);

  @override
  _SearchableHeaderState createState() => _SearchableHeaderState();
}

class _SearchableHeaderState extends State<SearchableHeader> {
  final myController = TextEditingController();

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: myController,
      textInputAction: TextInputAction.search,
      onSubmitted: (value) {
        widget.filterSearch(widget.keyName, value);
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: widget.label,
        labelStyle: TextStyle(fontSize: 13.0),
        suffixIcon: IconButton(
          onPressed: () {
            myController.clear();
            widget.filterSearch(widget.keyName, "");
          },
          icon: Icon(Icons.clear),
        ),
      ),
    );
  }
}
