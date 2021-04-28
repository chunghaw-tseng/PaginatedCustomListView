import 'package:flutter/material.dart';

class RowItems {
  final List<Widget> items;

  /// As expanded are irregular the actual widget has to be placeble
  final List<Widget> expanded;
  RowItems({@required this.items, this.expanded});
}
