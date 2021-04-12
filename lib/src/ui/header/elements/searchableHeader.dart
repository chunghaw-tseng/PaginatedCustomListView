import 'package:flutter/material.dart';

class SearchableHeader extends StatefulWidget {
  /// Label
  final String label;
  final ValueChanged<Map<String, String>> queryChanged;

  SearchableHeader({Key key, @required this.label, @required this.queryChanged})
      : super(key: key);

  @override
  _SearchableHeaderState createState() => _SearchableHeaderState();
}

class _SearchableHeaderState extends State<SearchableHeader> {
  final myController = TextEditingController();

  @override
  void initState() {
    super.initState();
    myController.addListener(_updateSearchQuery);
  }

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  _updateSearchQuery() {
    widget.queryChanged({widget.label: myController.text});
  }

  // OnSubmitted -> Completed
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: myController,
      // onEditingComplete: _updateSearchQuery,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: widget.label,
      ),
    );
  }
}
