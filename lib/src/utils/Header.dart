import 'package:flutter/material.dart';

class Header {
  final String label;

  /// This Widget can only be searchable, selectable, timeRange
  final Widget searchField;
  final String headerKey;
  Header(
      {@required this.label,
      @required this.searchField,
      @required this.headerKey});
}
