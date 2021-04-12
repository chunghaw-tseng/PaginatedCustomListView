import 'package:flutter/material.dart';

class ListRowWidget extends StatefulWidget {
  // Data Row
  // Also decide if this should expand
  // Needs to have different shades of color
  final List<Widget> cells;
  ListRowWidget({Key key, @required this.cells}) : super(key: key);

  @override
  _ListRowWidgetState createState() => _ListRowWidgetState();
}

// Check if there is any series uuid
class _ListRowWidgetState extends State<ListRowWidget> {
  @override
  Widget build(BuildContext context) {
    // ExpansionTile()
    // return Container(
    //     decoration: BoxDecoration(color: Colors.red),
    //     child: ListTile(
    //       onTap: () {},
    //       title: Row(
    //         children: widget.cells,
    //       ),
    // ));
    return ListTile(
      onTap: () {},
      title: Row(
        children: widget.cells,
      ),
    );
  }
}
