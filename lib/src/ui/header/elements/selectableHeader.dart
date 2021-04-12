import 'package:flutter/material.dart';
import 'package:paginatedlistview/src/utils/Callbacks.dart';

class SelectableHeader extends StatefulWidget {
  final String label;
  final List<String> selection;
  final SearchCallback filterSearch;
  SelectableHeader(
      {Key key,
      @required this.label,
      @required this.selection,
      @required this.filterSearch})
      : super(key: key);

  @override
  _SelectableHeaderState createState() => _SelectableHeaderState();
}

class _SelectableHeaderState extends State<SelectableHeader> {
  final searchQueries = Map<String, bool>();

  @override
  void initState() {
    super.initState();
    for (var i = 0; i < widget.selection.length; i++) {
      searchQueries[widget.selection[i]] = false;
    }
  }

  List<String> createQueries() {
    List<String> queries = [];
    searchQueries.forEach((key, value) {
      if (value) {
        queries.add(key);
      }
    });
    return queries;
  }

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      itemBuilder: (BuildContext bc) => widget.selection.map((e) {
        return PopupMenuItem(child: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
          return CheckboxListTile(
            title: Text(e),
            controlAffinity: ListTileControlAffinity.leading,
            value: searchQueries[e],
            onChanged: (bool value) {
              setState(() {
                searchQueries[e] = value;
                widget.filterSearch({widget.label: createQueries()});
              });
            },
            checkColor: Colors.green,
          );
        }));
      }).toList(),
      child: Container(
        height: 60,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[Text("Select"), Icon(Icons.arrow_drop_down)],
        ),
      ),
      onSelected: (value) {},
    );
  }
}
