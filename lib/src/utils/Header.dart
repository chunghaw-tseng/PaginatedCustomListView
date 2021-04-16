import 'package:flutter/material.dart';

class Header {
  final String label;

  /// This Widget can only be searchable, selectable, timeRange
  final Widget searchField;
  final String headerKey;
  Header({this.label, this.searchField, this.headerKey});
}
