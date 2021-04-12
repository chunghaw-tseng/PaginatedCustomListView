import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:paginatedlistview/src/utils/Callbacks.dart';

class SearchableHeader extends StatefulWidget {
  /// Label
  final String label;
  final SearchCallback queryChanged;

  SearchableHeader({Key key, @required this.label, @required this.queryChanged})
      : super(key: key);

  @override
  _SearchableHeaderState createState() => _SearchableHeaderState();
}

class _SearchableHeaderState extends State<SearchableHeader> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      textInputAction: TextInputAction.search,
      onSubmitted: (value) {
        widget.queryChanged({widget.label: value});
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: widget.label,
      ),
    );
  }
}
