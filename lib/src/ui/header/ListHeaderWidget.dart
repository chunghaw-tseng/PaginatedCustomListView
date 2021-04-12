import 'package:flutter/material.dart';
import 'package:paginatedlistview/src/ui/header/elements/headerWidget.dart';

class ListHeaderWidget extends StatefulWidget {
  final List<HeaderWidget> headers;
  ListHeaderWidget({Key key, @required this.headers}) : super(key: key);

  @override
  _ListHeaderWidgetState createState() => _ListHeaderWidgetState();
}

class _ListHeaderWidgetState extends State<ListHeaderWidget> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: null,
      title: Container(
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.black))),
        child: Row(
          children: widget.headers,
        ),
      ),
    );
  }
}
