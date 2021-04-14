import 'package:flutter/material.dart';
import 'package:paginatedlistview/src/ui/header/elements/searchableHeader.dart';
import 'package:paginatedlistview/src/ui/header/elements/selectableHeader.dart';
import 'package:paginatedlistview/src/ui/header/elements/timeRangeHeader.dart';
import 'package:paginatedlistview/src/utils/Callbacks.dart';

enum HeaderType { searchable, selectable, none, date }

class HeaderWidget extends StatefulWidget {
  /// The main title for the header
  final String title;

  /// The label for the filter widget
  final String label;

  ///
  final List<String> selection;

  /// The callback for when values have changed
  final SearchCallback query;

  /// The type of filter widget to add into the header
  final HeaderType type;

  HeaderWidget(
      {Key key,
      @required this.title,
      @required this.label,
      this.query,
      this.selection,
      @required this.type})
      : assert(title != null),
        assert(type != null),
        super(key: key);

  @override
  _HeaderWidgetState createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget> {
  Widget createFunction(HeaderType type) {
    switch (type) {
      case HeaderType.searchable:
        {
          assert(widget.selection == null);
          return SearchableHeader(
              label: widget.label, queryChanged: widget.query);
        }
      case HeaderType.selectable:
        {
          assert(widget.selection.length > 0);
          return SelectableHeader(
              label: widget.label,
              selection: widget.selection,
              filterSearch: widget.query);
        }
      case HeaderType.date:
        {
          return TimeRangeHeader(
            textSearch: true,
            label: widget.label,
            timeChanged: widget.query,
          );
        }
      default:
        {
          assert(widget.selection == null);
          return Container(
            height: 60,
          );
        }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.all(5),
        child: Column(
          children: [
            Padding(
                padding: EdgeInsets.all(5),
                child: Text(
                  widget.title,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )),
            createFunction(widget.type)
          ],
        ),
      ),
    );
  }
}
