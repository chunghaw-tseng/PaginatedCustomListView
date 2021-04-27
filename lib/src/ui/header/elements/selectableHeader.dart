import 'package:flutter/material.dart';
import 'package:paginatedlistview/src/utils/Callbacks.dart';

// TODO Selection cannot have same name
class SelectableHeader extends StatefulWidget {
  final String label;
  final String keyName;
  final List<String> selection;
  final SearchCallback filterSearch;
  SelectableHeader(
      {Key key,
      @required this.label,
      @required this.selection,
      @required this.keyName,
      @required this.filterSearch})
      : assert(selection.length > 0, "Selection cannot be empty"),
        super(key: key);

  @override
  _SelectableHeaderState createState() => _SelectableHeaderState();
}

class _SelectableHeaderState extends State<SelectableHeader> {
  final _searchQueries = Map<String, bool>();

  @override
  void initState() {
    super.initState();
    for (var i = 0; i < widget.selection.length; i++) {
      assert(_searchQueries.containsKey(widget.selection[i]) != true);
      _searchQueries[widget.selection[i]] = false;
    }
  }

  List<String> createQueries() {
    List<String> queries = [];
    _searchQueries.forEach((key, value) {
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
            key: Key("$e"),
            controlAffinity: ListTileControlAffinity.leading,
            value: _searchQueries[e],
            onChanged: (bool value) {
              setState(() {
                print("$e $value");
                _searchQueries[e] = value;
                widget.filterSearch(widget.keyName, createQueries());
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
          children: <Widget>[Text("Choices"), Icon(Icons.arrow_drop_down)],
        ),
      ),
      onSelected: (value) {},
    );
  }
}
