import 'package:flutter/material.dart';
import 'package:paginatedlistview/src/ui/footer/elements/PageItemsWidget.dart';
import 'package:paginatedlistview/src/ui/footer/elements/PageSelectorWidget.dart';

class ListFooterWidget extends StatefulWidget {
  ListFooterWidget({Key key}) : super(key: key);

  @override
  _ListFooterWidgetState createState() => _ListFooterWidgetState();
}

class _ListFooterWidgetState extends State<ListFooterWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [PageItemsWidgets(), PageSelectorWidget()],
    );
  }
}
