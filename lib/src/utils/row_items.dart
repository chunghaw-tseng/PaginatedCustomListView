import 'package:flutter/material.dart';
import 'package:paginatedlistview/paginatedlistview.dart';

class RowItems {
  final List<Widget> items;

  /// As expanded are irregular the actual widget has to be placeble
  final List<ListItem> expanded;
  RowItems({@required this.items, this.expanded});
}
